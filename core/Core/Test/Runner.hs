{-# LANGUAGE OverloadedStrings #-}

module Core.Test.Runner where

import Control.Applicative ((<|>))
import Control.Exception (SomeException, displayException, try)
import Core.Executor.Class qualified as C
import Core.Generator.Class (GenData (..), Generator, generate)
import Core.Judge.Class (Judge, judge)
import Core.Judge.Class qualified as J
import Core.Judge.Exact qualified as ETypes
import Core.Judge.IgnoreOrder qualified as ITypes
import Core.Test.Converter (toGenInfo)
import Core.Test.Types qualified as Types
import Core.Types
import Data.Either (fromRight)
import Data.List qualified
import Data.Map qualified as M
import Data.Maybe (fromJust, fromMaybe)
import Data.Text (Text)
import Data.Text qualified as T

data TestResult = Pass Int | WA (Maybe Text) Text Text | TLE Text | RE Text Text | Internal Text deriving (Show, Eq)

data SolutionBatch = SolutionBatch {entryMain :: Text, sbLang :: Language, solution :: Text, utilities :: Text, python3Utilities :: Text}

data PreparedCase = PreparedCase
  { pcIdx :: Int,
    pcJudge :: AnyJudge,
    pcExpected :: Maybe Text,
    pcMainCall :: Text,
    pcOracleCall :: Maybe Text
  }

data MainCaseOutput = MainCaseOutput
  { mcoStdout :: Text,
    mcoTimeMs :: Int,
    mcoResult :: Text
  }

runSuite ::
  (C.CodeExecutor e, Generator g) =>
  e ->
  g ->
  SolutionBatch ->
  Types.TestSuite ->
  IO [(Int, TestResult)]
runSuite exec gen batch suite = runSuiteWithProgress exec gen batch suite (\_ _ -> pure ())

runSuiteWithProgress ::
  (C.CodeExecutor e, Generator g) =>
  e ->
  g ->
  SolutionBatch ->
  Types.TestSuite ->
  (Int -> Int -> IO ()) ->
  IO [(Int, TestResult)]
runSuiteWithProgress exec gen batch suite onProgress = do
  let preparedCases = zipWith (prepareCase gen batch (Types.tsSeed suite) suite) [1 ..] (Types.tsCases suite)
  mainOutputsOrExc <- try (runMainBatch exec batch suite preparedCases) :: IO (Either SomeException (M.Map Int MainCaseOutput))
  case mainOutputsOrExc of
    Left exc -> pure [(1, Internal (T.pack (displayException exc)))]
    Right mainOutputs -> do
      oracleOutputsOrExc <- try (runOracleBatch exec gen batch suite preparedCases mainOutputs) :: IO (Either SomeException (M.Map Int Bool))
      let oracleOutputs = fromRight M.empty oracleOutputsOrExc
      let oracleFailure = either (Just . T.pack . displayException) (const Nothing) oracleOutputsOrExc
      let total = length preparedCases
      let timeLimit = Types.tlTimeMs (Types.tsLimits suite)
      results <- mapM (evaluateCase timeLimit oracleFailure oracleOutputs mainOutputs) preparedCases
      mapM_ (\done -> onProgress done total) [1 .. total]
      pure $
        case Data.List.find (\(_, res) -> case res of Pass _ -> False; _ -> True) results of
          Just failed -> [failed]
          Nothing -> results

prepareCase ::
  (Generator g) =>
  g ->
  SolutionBatch ->
  Int ->
  Types.TestSuite ->
  Int ->
  Types.TestCase ->
  PreparedCase
prepareCase gen batch sSeed suite idx test =
  let lang = sbLang batch
      seed = fromMaybe sSeed (Types.tcSeed test)
      judType = fromMaybe (Types.tsJudge suite) (Types.tcJudge test)
      jud = convertTestJudgeToJudge (Types.jType judType)
      (inCases, inConsts, inGens) = foldr splitIn ([], [], []) (Types.tcIn test)
      splitIn (var, Types.InCase c) (cs, ks, gs) = ((var, c) : cs, ks, gs)
      splitIn (var, Types.InGenerated gd) (cs, ks, gs) = (cs, ks, (var, gd) : gs)
      splitIn (var, Types.InConst d) (cs, ks, gs) = (cs, (var, d) : ks, gs)
      generateField renderLang (var, gData) =
        let gInfo = toGenInfo gData
            genData = GenData seed gInfo renderLang
         in (var, generate gen genData)
      genResults = map (generateField lang) inGens
      oracleGenResults = map (generateField Python3) inGens
      constResults =
        map
          ( \(var, d) ->
              let rendered = renderConst lang d
                  prepared =
                    if expectsRustOptionList lang callStr var
                      then wrapRustOptionList rendered
                      else rendered
               in (var, prepared)
          )
          inConsts
      oracleConstResults = map (\(var, d) -> (var, renderConst Python3 d)) inConsts
      callStr = case Types.tcCall test of
        Just call -> fromJust (M.lookup lang call)
        Nothing -> fromJust (M.lookup lang (Types.teCall $ Types.tsEntry suite))
      buildCall renderLang callTemplate gens consts cases =
        let entryWithCall = callTemplate
            afterGen = foldl (\acc (var, res) -> T.replace ("{" <> var <> "}") res acc) entryWithCall gens
            afterConst = foldl (\acc (var, res) -> T.replace ("{" <> var <> "}") res acc) afterGen consts
         in foldl
              ( \acc (var, val) ->
                  let preparedVal = prepareInValue renderLang val
                   in T.replace ("{" <> var <> "}") preparedVal acc
              )
              afterConst
              cases
      mainCall = buildCall lang callStr genResults constResults inCases
      oracleCall =
        case Types.tcOut test of
          Just _ -> Nothing
          Nothing ->
            case M.lookup Python3 (Types.tsOracle suite) of
              Nothing -> Nothing
              Just oracleSolution ->
                Just (buildCall Python3 (Types.call oracleSolution) oracleGenResults oracleConstResults inCases)
   in PreparedCase
        { pcIdx = idx,
          pcJudge = jud,
          pcExpected = case Types.tcOut test of
            Just (Types.OutCase expected) -> Just expected
            Nothing -> Nothing,
          pcMainCall = mainCall,
          pcOracleCall = oracleCall
        }

runMainBatch ::
  (C.CodeExecutor e) =>
  e ->
  SolutionBatch ->
  Types.TestSuite ->
  [PreparedCase] ->
  IO (M.Map Int MainCaseOutput)
runMainBatch exec batch suite cases = do
  response <-
    C.execute
      exec
      ( C.ExecRequest
          { C.language = sbLang batch,
            C.content = buildMainProgram batch cases,
            C.runTimeout = Just batchTimeoutMs,
            C.runMemoryLimit = Just (Types.tlMemoryMb (Types.tsLimits suite))
          }
      )
  case response of
    C.ExecFail err s -> fail (T.unpack (renderExecError s err))
    C.ExecSuc stdoutText -> parseMainBatchOutput cases stdoutText

runOracleBatch ::
  (C.CodeExecutor e, Generator g) =>
  e ->
  g ->
  SolutionBatch ->
  Types.TestSuite ->
  [PreparedCase] ->
  M.Map Int MainCaseOutput ->
  IO (M.Map Int Bool)
runOracleBatch exec _ batch suite cases mainOutputs =
  if null oracleCases
    then pure M.empty
    else do
      let oracleSolution = fromJust (M.lookup Python3 (Types.tsOracle suite))
      let oracleProgram = buildOracleProgram batch oracleSolution oracleCases mainOutputs
      response <-
        C.execute
          exec
          ( C.ExecRequest
              { C.language = Python3,
                C.content = oracleProgram,
                C.runTimeout = Just batchTimeoutMs,
                C.runMemoryLimit = Nothing
              }
          )
      case response of
        C.ExecFail err s -> fail (T.unpack ("Oracle execution error: " <> renderExecError s err))
        C.ExecSuc stdoutText -> parseOracleBatchOutput oracleCases stdoutText
  where
    oracleCases = filter (\pc -> case pcExpected pc of Just _ -> False; Nothing -> True) cases

evaluateCase ::
  Int ->
  Maybe Text ->
  M.Map Int Bool ->
  M.Map Int MainCaseOutput ->
  PreparedCase ->
  IO (Int, TestResult)
evaluateCase timeLimit oracleFailure oracleOutputs mainOutputs pc =
  let out = fromJust (M.lookup (pcIdx pc) mainOutputs)
   in if mcoTimeMs out > timeLimit
        then pure (pcIdx pc, TLE (mcoStdout out))
        else case pcExpected pc of
          Just expected ->
            let res = judge (pcJudge pc) expected (mcoResult out)
             in pure $
                  case res of
                    J.Pass -> (pcIdx pc, Pass (mcoTimeMs out))
                    J.Fail _ -> (pcIdx pc, WA (Just expected) (mcoResult out) (mcoStdout out))
          Nothing ->
            case oracleFailure of
              Just msg -> pure (pcIdx pc, Internal msg)
              Nothing ->
                case fromJust (M.lookup (pcIdx pc) oracleOutputs) of
                  True -> pure (pcIdx pc, Pass (mcoTimeMs out))
                  False -> pure (pcIdx pc, WA Nothing (mcoResult out) (mcoStdout out))

buildMainProgram :: SolutionBatch -> [PreparedCase] -> Text
buildMainProgram batch cases =
  buildProgramTemplate (sbLang batch) (entryMain batch) (solution batch) (utilities batch) snippets
  where
    snippets = map (\pc -> buildMainSnippet (sbLang batch) (pcIdx pc) (pcMainCall pc)) cases

buildOracleProgram :: SolutionBatch -> Types.TestOracleEntry -> [PreparedCase] -> M.Map Int MainCaseOutput -> Text
buildOracleProgram batch oracleSolution cases mainOutputs =
  T.unlines $
    [ "import datetime as _dt",
      "from dataclasses import is_dataclass, asdict",
      "from typing import *",
      python3Utilities batch,
      "",
      Types.checker oracleSolution
    ]
      ++ map buildSnippet cases
  where
    buildSnippet pc =
      let resultLiteral =
            case M.lookup (pcIdx pc) mainOutputs of
              Just out -> T.pack (show (T.unpack (T.strip (mcoResult out))))
              Nothing -> "\"\""
          callExpr =
            T.replace "{result}" resultLiteral $
              fromJust (pcOracleCall pc)
       in T.unlines
            [ "print(" <> T.pack (show (T.unpack (marker (pcIdx pc)))) <> ")",
              "print(to_json(" <> callExpr <> "))"
            ]

buildProgramTemplate :: Language -> Text -> Text -> Text -> [Text] -> Text
buildProgramTemplate lang template rawSolution runtimeUtilities snippets =
  let (userImports, userSolution) =
        case lang of
          Java -> splitJavaCode rawSolution
          Cpp -> splitCppCode rawSolution
          Rust -> splitRustCode rawSolution
          _ -> ("", rawSolution)
      withImports = T.replace "${IMPORTS}" userImports template
      withInsertion = T.replace "${INSERTION}" (T.intercalate "\n" snippets) withImports
      withCall = T.replace "${CALL_SOLUTION}" "" withInsertion
      withRuntime = T.replace "${UTILITIES}" runtimeUtilities withCall
   in T.replace "${SOLUTION}" userSolution withRuntime

buildMainSnippet :: Language -> Int -> Text -> Text
buildMainSnippet lang idx callExpr =
  case lang of
    Python3 -> pythonSnippet
    Python2 -> pythonSnippet
    Go ->
      T.unlines
        [ "fmt.Println(" <> quotedMarker <> ")",
          "cur" <> suffix <> " := time.Now().UnixNano() / 1_000_000",
          "a" <> suffix <> " := " <> callExpr,
          "now" <> suffix <> " := time.Now().UnixNano() / 1_000_000",
          "fmt.Println(now" <> suffix <> " - cur" <> suffix <> ")",
          "fmt.Println(toJson(a" <> suffix <> "))"
        ]
    TypeScript ->
      T.unlines
        [ "console.log(" <> quotedMarker <> ");",
          "const _start" <> suffix <> " = Date.now();",
          "const _a" <> suffix <> " = " <> callExpr <> ";",
          "const _end" <> suffix <> " = Date.now();",
          "console.log(String(_end" <> suffix <> " - _start" <> suffix <> "));",
          "console.log(toJson(_a" <> suffix <> "));"
        ]
    Dart ->
      T.unlines
        [ "print(" <> quotedMarker <> ");",
          "final start" <> suffix <> " = Stopwatch()..start();",
          "final a" <> suffix <> " = " <> callExpr <> ";",
          "start" <> suffix <> ".stop();",
          "print(start" <> suffix <> ".elapsedMilliseconds);",
          "print(toJson(a" <> suffix <> "));"
        ]
    Cpp ->
      T.unlines
        [ "cout << " <> quotedMarker <> " << \"\\n\";",
          "auto start" <> suffix <> " = chrono::steady_clock::now();",
          "auto a" <> suffix <> " = " <> callExpr <> ";",
          "auto end" <> suffix <> " = chrono::steady_clock::now();",
          "cout << chrono::duration_cast<chrono::milliseconds>(end" <> suffix <> " - start" <> suffix <> ").count() << \"\\n\";",
          "cout << toJson(a" <> suffix <> ") << \"\\n\";"
        ]
    CSharp ->
      T.unlines
        [ "Console.WriteLine(" <> quotedMarker <> ");",
          "var sw" <> suffix <> " = Stopwatch.StartNew();",
          "var a" <> suffix <> " = " <> callExpr <> ";",
          "sw" <> suffix <> ".Stop();",
          "Console.WriteLine(sw" <> suffix <> ".ElapsedMilliseconds);",
          "Console.WriteLine(ToJson(a" <> suffix <> "));"
        ]
    Java ->
      T.unlines
        [ "System.out.println(" <> quotedMarker <> ");",
          "long cur" <> suffix <> " = System.currentTimeMillis();",
          "var a" <> suffix <> " = " <> callExpr <> ";",
          "long now" <> suffix <> " = System.currentTimeMillis();",
          "System.out.println(now" <> suffix <> " - cur" <> suffix <> ");",
          "System.out.println(Json.toJson(a" <> suffix <> "));"
        ]
    Kotlin ->
      T.unlines
        [ "println(" <> quotedMarker <> ")",
          "val cur" <> suffix <> " = System.currentTimeMillis()",
          "val a" <> suffix <> " = " <> callExpr,
          "val now" <> suffix <> " = System.currentTimeMillis()",
          "println(now" <> suffix <> " - cur" <> suffix <> ")",
          "println(Json.toJson(a" <> suffix <> "))"
        ]
    Rust ->
      T.unlines
        [ "println!(\"" <> marker idx <> "\");",
          "let start" <> suffix <> " = Instant::now();",
          "let result" <> suffix <> " = " <> callExpr <> ";",
          "let duration" <> suffix <> " = start" <> suffix <> ".elapsed();",
          "println!(\"{}\", duration" <> suffix <> ".as_millis());",
          "println!(\"{}\", to_json(&result" <> suffix <> "));"
        ]
    Ruby ->
      T.unlines
        [ "puts " <> quotedMarker,
          "start" <> suffix <> " = (Time.now.to_f * 1000).to_i",
          "a" <> suffix <> " = " <> callExpr,
          "finish" <> suffix <> " = (Time.now.to_f * 1000).to_i",
          "puts(finish" <> suffix <> " - start" <> suffix <> ")",
          "puts to_json(a" <> suffix <> ")"
        ]
    Swift ->
      T.unlines
        [ "print(" <> quotedMarker <> ")",
          "let start" <> suffix <> " = Int(Date().timeIntervalSince1970 * 1000)",
          "let result" <> suffix <> " = " <> callExpr,
          "let end" <> suffix <> " = Int(Date().timeIntervalSince1970 * 1000)",
          "print(end" <> suffix <> " - start" <> suffix <> ")",
          "print(toJson(result" <> suffix <> "))"
        ]
    Default -> error "Unsupported"
  where
    suffix = T.pack (show idx)
    quotedMarker = T.pack (show (T.unpack (marker idx)))
    pythonSnippet =
      T.unlines
        [ "print(" <> quotedMarker <> ")",
          "_start_" <> suffix <> " = int(" <> pythonTimeExpr <> " * 1000)",
          "_a_" <> suffix <> " = " <> callExpr,
          "_end_" <> suffix <> " = int(" <> pythonTimeExpr <> " * 1000)",
          "print(_end_" <> suffix <> " - _start_" <> suffix <> ")",
          "print(to_json(_a_" <> suffix <> "))"
        ]
    pythonTimeExpr =
      case lang of
        Python2 -> "_time.time()"
        _ -> "time.time()"

parseMainBatchOutput :: [PreparedCase] -> Text -> IO (M.Map Int MainCaseOutput)
parseMainBatchOutput cases stdoutText =
  parseBatchOutputs marker cases stdoutText parseMainSection
  where
    parseMainSection _ section = do
      let rawLines = T.lines section
          revLines = reverse rawLines
          resultLine = head revLines
          timeLine = revLines !! 1
          stdoutLines = drop 2 revLines
          ms = read (T.unpack (T.strip timeLine)) :: Int
      pure (MainCaseOutput (T.unlines (reverse stdoutLines)) ms resultLine)

parseOracleBatchOutput :: [PreparedCase] -> Text -> IO (M.Map Int Bool)
parseOracleBatchOutput cases stdoutText =
  parseBatchOutputs marker cases stdoutText parseOracleSection
  where
    parseOracleSection _ section =
      pure $ T.strip (last (T.lines section)) == "true"

parseBatchOutputs ::
  (Int -> Text) ->
  [PreparedCase] ->
  Text ->
  (Int -> Text -> IO a) ->
  IO (M.Map Int a)
parseBatchOutputs markerBuilder cases stdoutText parseSection = do
  sections <- parseSections markerBuilder (map pcIdx cases) stdoutText
  fmap M.fromList $
    mapM
      ( \pc -> do
          parsed <- parseSection (pcIdx pc) (fromJust (M.lookup (pcIdx pc) sections))
          pure (pcIdx pc, parsed)
      )
      cases

parseSections :: (Int -> Text) -> [Int] -> Text -> IO (M.Map Int Text)
parseSections markerBuilder indices stdoutText = go (T.lines stdoutText) Nothing [] M.empty
  where
    markerMap = M.fromList [(markerBuilder idx, idx) | idx <- indices]
    flushSection Nothing _ acc = acc
    flushSection (Just idx) revLines acc = M.insert idx (T.unlines (reverse revLines)) acc
    go [] current revLines acc = pure (flushSection current revLines acc)
    go (line : rest) current revLines acc =
      case M.lookup line markerMap of
        Just idx ->
          let acc' = flushSection current revLines acc
           in go rest (Just idx) [] acc'
        Nothing ->
          case current of
            Nothing -> go rest current revLines acc
            Just _ -> go rest current (line : revLines) acc

marker :: Int -> Text
marker idx = "SOL_CASE_" <> T.pack (show idx)

batchTimeoutMs :: Int
batchTimeoutMs = 15000

renderExecError :: C.ExecStatus -> Text -> Text
renderExecError C.TLE err = "TLE " <> err
renderExecError C.RE err = err
renderExecError (C.Unknown s) err = s <> " " <> err

data AnyJudge = ExactJudge ETypes.Exact | IgnoreOrderJudge ITypes.IgnoreOrder

instance Judge AnyJudge where
  judge (ExactJudge j) = judge j
  judge (IgnoreOrderJudge j) = judge j

convertTestJudgeToJudge :: Types.JudgeType -> AnyJudge
convertTestJudgeToJudge Types.Exact = ExactJudge ETypes.Exact
convertTestJudgeToJudge Types.IgnoreOrder = IgnoreOrderJudge ITypes.IgnoreOrder

splitJavaCode :: Text -> (Text, Text)
splitJavaCode code =
  let allLines = T.lines code
      (importLines, restLines) = Data.List.partition (\l -> "import " `T.isPrefixOf` T.dropWhile (== ' ') l) allLines
   in (T.unlines importLines, T.unlines restLines)

splitCppCode :: Text -> (Text, Text)
splitCppCode code =
  let allLines = T.lines code
      isInclude l =
        let trimmed = T.dropWhile (== ' ') l
         in "#include" `T.isPrefixOf` trimmed
      (includeLines, restLines) = Data.List.partition isInclude allLines
   in (T.unlines includeLines, T.unlines restLines)

splitRustCode :: Text -> (Text, Text)
splitRustCode code =
  let allLines = T.lines code
      isUse l = "use " `T.isPrefixOf` T.dropWhile (== ' ') l
      (useLines, restLines) = Data.List.partition isUse allLines
   in (T.unlines useLines, T.unlines restLines)

prepareInValue :: Language -> Text -> Text
prepareInValue lang =
  replaceNulls
  where
    replaceNulls = T.replace "null" (nullLiteral lang)

-- todo: bullshit
expectsRustOptionList :: Language -> Text -> Text -> Bool
expectsRustOptionList lang callStr var =
  lang == Rust && (("to_tree_node(vec![{" <> var <> "}])") `T.isInfixOf` callStr)

wrapRustOptionList :: Text -> Text
wrapRustOptionList raw =
  T.intercalate ", " (map wrapItem nonEmptyItems)
  where
    nonEmptyItems = filter (not . T.null) (map T.strip (T.splitOn "," raw))
    wrapItem x
      | x == "None" = x
      | "Some(" `T.isPrefixOf` x = x
      | otherwise = "Some(" <> x <> ")"

renderNestedArr :: Language -> Maybe Types.GIDArrElemType -> [Text] -> Text
renderNestedArr lang et rows =
  T.intercalate ", " (map (wrapArray lang et) rows)

renderConst :: Language -> Types.GeneratedInData -> Text
renderConst lang (Types.GIDArr (Types.GIDArrConst xs elemType)) =
  T.intercalate ", " (map (renderConstArrayItem lang elemType) xs)
renderConst _ (Types.GIDIntegral (Types.GIDGenIntegralConst n)) = T.pack (show n)
renderConst _ (Types.GIDFloat (Types.GIDGenFloatConst f)) = T.pack (show f)
renderConst _ (Types.GIDChar (Types.GIDGenCharConst c)) = T.pack (show c)
renderConst lang Types.GIDNull = nullLiteral lang
renderConst lang (Types.GIDBool (Types.GIDGenBoolConst b)) =
  if lang == Python3 || lang == Python2
    then T.pack (show b)
    else T.toLower . T.pack $ show b
renderConst _ (Types.GIDStr (Types.GIDStrConst s)) = T.pack (show s)
renderConst _ (Types.GIDStr (Types.GIDStrGen _ _)) = error "unsupported"
renderConst _ _ = error "unsupported"

renderConstArrayItem :: Language -> Maybe Types.GIDArrElemType -> Types.GeneratedInData -> Text
renderConstArrayItem lang inheritedElemType (Types.GIDArr (Types.GIDArrConst xs elemType)) =
  let et = elemType <|> inheritedElemType
   in wrapArray lang et $ T.intercalate ", " (map (renderConstArrayItem lang et) xs)
renderConstArrayItem lang (Just Types.GIDArrElemChar) (Types.GIDStr (Types.GIDStrConst s))
  | T.length s == 1 = renderConst lang (Types.GIDChar (Types.GIDGenCharConst (T.head s)))
renderConstArrayItem lang _ val = renderConst lang val

wrapArray :: Language -> Maybe Types.GIDArrElemType -> Text -> Text
wrapArray lang elemType inner = case lang of
  Java ->
    let t = case elemType of
          Just Types.GIDArrElemInt -> "int"
          Just Types.GIDArrElemLong -> "long"
          Just Types.GIDArrElemDouble -> "double"
          Just Types.GIDArrElemFloat -> "float"
          Just Types.GIDArrElemString -> "String"
          Just Types.GIDArrElemChar -> "char"
          Just Types.GIDArrElemBool -> "boolean"
          _ -> "Object"
     in "new " <> t <> "[]{ " <> inner <> " }"
  Kotlin ->
    let f = case elemType of
          Just Types.GIDArrElemInt -> "intArrayOf"
          Just Types.GIDArrElemLong -> "longArrayOf"
          Just Types.GIDArrElemDouble -> "doubleArrayOf"
          Just Types.GIDArrElemFloat -> "floatArrayOf"
          Just Types.GIDArrElemString -> "arrayOf"
          Just Types.GIDArrElemChar -> "charArrayOf"
          Just Types.GIDArrElemBool -> "booleanArrayOf"
          _ -> "arrayOf"
     in f <> "(" <> inner <> ")"
  Cpp ->
    let t = case elemType of
          Just Types.GIDArrElemInt -> "int"
          Just Types.GIDArrElemLong -> "long long"
          Just Types.GIDArrElemDouble -> "double"
          Just Types.GIDArrElemFloat -> "float"
          Just Types.GIDArrElemString -> "string"
          Just Types.GIDArrElemChar -> "char"
          Just Types.GIDArrElemBool -> "bool"
          _ -> "int"
     in "lv(vector<" <> t <> ">{ " <> inner <> " })"
  CSharp ->
    let t = case elemType of
          Just Types.GIDArrElemInt -> "int"
          Just Types.GIDArrElemLong -> "long"
          Just Types.GIDArrElemDouble -> "double"
          Just Types.GIDArrElemFloat -> "float"
          Just Types.GIDArrElemString -> "string"
          Just Types.GIDArrElemChar -> "char"
          Just Types.GIDArrElemBool -> "bool"
          _ -> "object"
     in "new " <> t <> "[]{ " <> inner <> " }"
  Go -> "{" <> inner <> "}"
  Rust -> "vec![" <> inner <> "]"
  _ -> "[" <> inner <> "]"
