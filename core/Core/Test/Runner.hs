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
import Data.Aeson (Value (..), decodeStrictText, encode, object, (.=))
import Data.Aeson.Key qualified as K
import Data.ByteString.Lazy qualified as BL
import Data.Either (fromRight)
import Data.List qualified
import Data.Map qualified as M
import Data.Maybe (fromJust, fromMaybe)
import Data.Text (Text)
import Data.Text qualified as T
import Data.Text.Encoding qualified as TE
import Data.Vector qualified as V

data TestResult = Pass Int | WA (Maybe Text) Text Text | TLE Text | RE Text Text | Internal Text deriving (Show, Eq)

data SolutionBatch = SolutionBatch {entryMain :: Text, sbLang :: Language, solution :: Text, utilities :: Text, python3Utilities :: Text}

data PreparedCase = PreparedCase
  { pcIdx :: Int,
    pcJudge :: AnyJudge,
    pcExpected :: Maybe Text,
    pcPrelude :: [Text],
    pcJsonInputs :: M.Map Text Value,
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
      entryParams =
        case Types.teParams (Types.tsEntry suite) of
          Just params -> params
          Nothing -> error "entry.params is required"
      generateField renderLang (var, gData) =
        let gInfo = toGenInfo gData
            genData = GenData seed gInfo renderLang
            rendered = generate gen genData
         in ( var,
              if renderLang == Python3
                then wrapOracleGenerated (fromJust (M.lookup var entryParams)) rendered
                else rendered
            )
      oracleGenResults = map (generateField Python3) inGens
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
      mainCall = foldl (\acc (var, _) -> T.replace ("{" <> var <> "}") (jsonVarName idx var) acc) callStr (M.toList entryParams)
      jsonInputs = buildJsonInputs gen seed entryParams test
      prelude = buildParamPrelude lang idx entryParams
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
          pcPrelude = prelude,
          pcJsonInputs = jsonInputs,
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
            C.files = buildMainFiles cases,
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
                C.files = buildMainFiles cases,
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
    snippets = map (\pc -> buildMainSnippet (sbLang batch) (pcIdx pc) (pcPrelude pc) (pcMainCall pc)) cases

buildOracleProgram :: SolutionBatch -> Types.TestOracleEntry -> [PreparedCase] -> M.Map Int MainCaseOutput -> Text
buildOracleProgram batch oracleSolution cases mainOutputs =
  T.unlines $
    [ "import sys",
      "import time as _time",
      "import math",
      "import heapq",
      "import bisect",
      "import itertools",
      "import collections",
      "import json",
      "import datetime as _dt",
      "from dataclasses import is_dataclass, asdict",
      "from typing import *",
      "from functools import *",
      "from collections import *",
      "from heapq import *",
      "from bisect import *",
      python3Utilities batch,
      "",
      "with open(\"test.json\", \"r\", encoding=\"utf-8\") as _f:",
      "    _TEST_ = json.load(_f)",
      "",
      Types.checker oracleSolution
    ]
      ++ map buildSnippet cases
  where
    buildSnippet pc =
      let resultLiteral =
            "json.loads("
              <> T.pack (show (T.unpack (mcoResult (fromJust (M.lookup (pcIdx pc) mainOutputs)))))
              <> ")"
          callExpr =
            T.replace "{result}" resultLiteral $
              fromJust (pcOracleCall pc)
       in T.unlines
            ( ["_case_" <> suffix <> " = _TEST_[" <> T.pack (show (show (pcIdx pc))) <> "]"]
                ++ map (renderOracleBinding suffix) (M.keys (pcJsonInputs pc))
                ++ [ "print(" <> T.pack (show (T.unpack (marker (pcIdx pc)))) <> ")",
                     "print(to_json(" <> callExpr <> "))"
                   ]
            )
      where
        suffix = T.pack (show (pcIdx pc))

    renderOracleBinding suffix var =
      var <> " = _case_" <> suffix <> "[" <> T.pack (show (T.unpack var)) <> "][\"val\"]"

buildProgramTemplate :: Language -> Text -> Text -> Text -> [Text] -> Text
buildProgramTemplate lang template rawSolution runtimeUtilities snippets =
  let (userImports, userSolution) =
        case lang of
          Java -> splitJavaCode rawSolution
          Cpp -> splitCppCode rawSolution
          Rust -> splitRustCode rawSolution
          Kotlin -> splitKotlinCode rawSolution
          _ -> ("", rawSolution)
      withImports = T.replace "${IMPORTS}" userImports template
      withInsertion = T.replace "${INSERTION}" (T.intercalate "\n" snippets) withImports
      withCall = T.replace "${CALL_SOLUTION}" "" withInsertion
      withRuntime = T.replace "${UTILITIES}" runtimeUtilities withCall
   in T.replace "${SOLUTION}" userSolution withRuntime

buildMainSnippet :: Language -> Int -> [Text] -> Text -> Text
buildMainSnippet lang idx prelude callExpr =
  case lang of
    Python3 -> pythonSnippet
    Python2 -> pythonSnippet
    Go ->
      T.unlines
        ( ["fmt.Println(" <> quotedMarker <> ")"]
            ++ prelude
            ++ [ "cur" <> suffix <> " := time.Now().UnixNano() / 1_000_000",
                 "a" <> suffix <> " := " <> callExpr,
                 "now" <> suffix <> " := time.Now().UnixNano() / 1_000_000",
                 "fmt.Println(now" <> suffix <> " - cur" <> suffix <> ")",
                 "fmt.Println(toJson(a" <> suffix <> "))"
               ]
        )
    TypeScript ->
      T.unlines
        ( ["console.log(" <> quotedMarker <> ");"]
            ++ prelude
            ++ [ "const _start" <> suffix <> " = Date.now();",
                 "const _a" <> suffix <> " = " <> callExpr <> ";",
                 "const _end" <> suffix <> " = Date.now();",
                 "console.log(String(_end" <> suffix <> " - _start" <> suffix <> "));",
                 "console.log(toJson(_a" <> suffix <> "));"
               ]
        )
    Dart ->
      T.unlines
        ( ["print(" <> quotedMarker <> ");"]
            ++ prelude
            ++ [ "final start" <> suffix <> " = Stopwatch()..start();",
                 "final a" <> suffix <> " = " <> callExpr <> ";",
                 "start" <> suffix <> ".stop();",
                 "print(start" <> suffix <> ".elapsedMilliseconds);",
                 "print(toJson(a" <> suffix <> "));"
               ]
        )
    Cpp ->
      T.unlines
        ( ["cout << " <> quotedMarker <> " << \"\\n\";"]
            ++ prelude
            ++ [ "auto start" <> suffix <> " = chrono::steady_clock::now();",
                 "auto a" <> suffix <> " = " <> callExpr <> ";",
                 "auto end" <> suffix <> " = chrono::steady_clock::now();",
                 "cout << chrono::duration_cast<chrono::milliseconds>(end" <> suffix <> " - start" <> suffix <> ").count() << \"\\n\";",
                 "cout << toJson(a" <> suffix <> ") << \"\\n\";"
               ]
        )
    CSharp ->
      T.unlines
        ( ["Console.WriteLine(" <> quotedMarker <> ");"]
            ++ prelude
            ++ [ "var sw" <> suffix <> " = Stopwatch.StartNew();",
                 "var a" <> suffix <> " = " <> callExpr <> ";",
                 "sw" <> suffix <> ".Stop();",
                 "Console.WriteLine(sw" <> suffix <> ".ElapsedMilliseconds);",
                 "Console.WriteLine(ToJson(a" <> suffix <> "));"
               ]
        )
    Java ->
      T.unlines
        ( ["System.out.println(" <> quotedMarker <> ");"]
            ++ prelude
            ++ [ "long cur" <> suffix <> " = System.currentTimeMillis();",
                 "var a" <> suffix <> " = " <> callExpr <> ";",
                 "long now" <> suffix <> " = System.currentTimeMillis();",
                 "System.out.println(now" <> suffix <> " - cur" <> suffix <> ");",
                 "System.out.println(Json.toJson(a" <> suffix <> "));"
               ]
        )
    Kotlin ->
      T.unlines
        ( ["println(" <> quotedMarker <> ")"]
            ++ prelude
            ++ [ "val cur" <> suffix <> " = System.currentTimeMillis()",
                 "val a" <> suffix <> " = " <> callExpr,
                 "val now" <> suffix <> " = System.currentTimeMillis()",
                 "println(now" <> suffix <> " - cur" <> suffix <> ")",
                 "println(Json.toJson(a" <> suffix <> "))"
               ]
        )
    Rust ->
      T.unlines
        ( ["println!(\"" <> marker idx <> "\");"]
            ++ prelude
            ++ [ "let start" <> suffix <> " = Instant::now();",
                 "let result" <> suffix <> " = " <> callExpr <> ";",
                 "let duration" <> suffix <> " = start" <> suffix <> ".elapsed();",
                 "println!(\"{}\", duration" <> suffix <> ".as_millis());",
                 "println!(\"{}\", to_json(&result" <> suffix <> "));"
               ]
        )
    Ruby ->
      T.unlines
        ( ["puts " <> quotedMarker]
            ++ prelude
            ++ [ "start" <> suffix <> " = (Time.now.to_f * 1000).to_i",
                 "a" <> suffix <> " = " <> callExpr,
                 "finish" <> suffix <> " = (Time.now.to_f * 1000).to_i",
                 "puts(finish" <> suffix <> " - start" <> suffix <> ")",
                 "puts to_json(a" <> suffix <> ")"
               ]
        )
    Swift ->
      T.unlines
        ( ["print(" <> quotedMarker <> ")"]
            ++ prelude
            ++ [ "let start" <> suffix <> " = Int(Date().timeIntervalSince1970 * 1000)",
                 "let result" <> suffix <> " = " <> callExpr,
                 "let end" <> suffix <> " = Int(Date().timeIntervalSince1970 * 1000)",
                 "print(end" <> suffix <> " - start" <> suffix <> ")",
                 "print(toJson(result" <> suffix <> "))"
               ]
        )
    Default -> error "Unsupported"
  where
    suffix = T.pack (show idx)
    quotedMarker = T.pack (show (T.unpack (marker idx)))
    pythonSnippet =
      T.unlines
        ( ["print(" <> quotedMarker <> ")"]
            ++ prelude
            ++ [ "_start_" <> suffix <> " = int(" <> pythonTimeExpr <> " * 1000)",
                 "_a_" <> suffix <> " = " <> callExpr,
                 "_end_" <> suffix <> " = int(" <> pythonTimeExpr <> " * 1000)",
                 "print(_end_" <> suffix <> " - _start_" <> suffix <> ")",
                 "print(to_json(_a_" <> suffix <> "))"
               ]
        )
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
batchTimeoutMs = 80000

buildMainStdin :: [PreparedCase] -> Maybe Text
buildMainStdin cases =
  let payload =
        object
          [ K.fromText (T.pack (show (pcIdx pc)))
              .= object
                [ K.fromText name .= object ["val" .= val]
                | (name, val) <- M.toList (pcJsonInputs pc)
                ]
          | pc <- cases
          ]
   in Just (TE.decodeUtf8 (BL.toStrict (encode payload)))

buildMainFiles :: [PreparedCase] -> [C.ExecFile]
buildMainFiles cases =
  case buildMainStdin cases of
    Just payload -> [C.ExecFile "test.json" payload]
    Nothing -> []

buildJsonInputs :: (Generator g) => g -> Int -> M.Map Text Types.TestParams -> Types.TestCase -> M.Map Text Value
buildJsonInputs gen seed params test =
  M.fromList
    [ (var, inputToJson gen seed schema inputData)
    | (var, inputData) <- Types.tcIn test,
      let schema = fromJust (M.lookup var params)
    ]

inputToJson :: (Generator g) => g -> Int -> Types.TestParams -> Types.TestCaseInData -> Value
inputToJson _ _ schema (Types.InCase t) =
  case Types.tpaType schema of
    Types.TPTString -> String t
    Types.TPTChar -> String t
    _ -> textToJsonValue t
inputToJson _ _ _ (Types.InConst d) = generatedInDataToJson d
inputToJson gen seed schema (Types.InGenerated gd) = generatedInputToJson gen seed schema gd

generatedInputToJson :: (Generator g) => g -> Int -> Types.TestParams -> Types.GeneratedInData -> Value
generatedInputToJson gen seed schema gd =
  let rendered = generate gen (GenData seed (toGenInfo gd) Python3)
   in parseGeneratedRendered schema rendered

parseGeneratedRendered :: Types.TestParams -> Text -> Value
parseGeneratedRendered schema rendered =
  case Types.tpaType schema of
    Types.TPTInt -> textToJsonValue rendered
    Types.TPTLong -> textToJsonValue rendered
    Types.TPTDouble -> textToJsonValue rendered
    Types.TPTFloat -> textToJsonValue rendered
    Types.TPTBool ->
      case rendered of
        "True" -> Bool True
        "False" -> Bool False
        _ -> error "Unsupported generated bool value"
    Types.TPTString -> jsonStringValue rendered
    Types.TPTChar -> jsonStringValue rendered
    Types.TPTArray ->
      case Types.tpaItems schema of
        Just items@(Types.TestParams Types.TPTChar _) ->
          Array $ V.fromList $ map (parseGeneratedRendered items) (splitTopLevelItems rendered)
        Just items@(Types.TestParams Types.TPTArray _) ->
          Array $
            V.fromList $
              map
                (parseGeneratedRendered items . stripOuterBrackets)
                (splitTopLevelItems rendered)
        _ -> textToJsonValue ("[" <> rendered <> "]")
    Types.TPTListNode -> textToJsonValue ("[" <> rendered <> "]")
    Types.TPTTreeNode -> textToJsonValue ("[" <> rendered <> "]")

splitTopLevelItems :: Text -> [Text]
splitTopLevelItems raw = go 0 T.empty [] (T.unpack raw)
  where
    go _ current acc [] =
      let item = T.strip current
       in reverse (if T.null item then acc else item : acc)
    go depth current acc (c : cs)
      | c == '[' = go (depth + 1) (T.snoc current c) acc cs
      | c == ']' = go (depth - 1) (T.snoc current c) acc cs
      | c == ',' && depth == 0 =
          let item = T.strip current
              acc' = if T.null item then acc else item : acc
           in go depth T.empty acc' cs
      | otherwise = go depth (T.snoc current c) acc cs

stripOuterBrackets :: Text -> Text
stripOuterBrackets t =
  let s = T.strip t
   in fromMaybe s $ do
        rest <- T.stripPrefix "[" s
        inner <- T.stripSuffix "]" rest
        pure (T.strip inner)

jsonStringValue :: Text -> Value
jsonStringValue raw =
  case decodeStrictText raw of
    Just (String s) -> String s
    _ -> String raw

jsonVarName :: Int -> Text -> Text
jsonVarName idx var = "_" <> var <> "_" <> T.pack (show idx)

jsonAccessorJava :: Int -> Text -> Text
jsonAccessorJava idx name = "_TEST_.get(\"" <> T.pack (show idx) <> "\").get(\"" <> name <> "\").val"

jsonAccessorCpp :: Int -> Text -> Text
jsonAccessorCpp idx name = "_TEST_DATA_[\"" <> T.pack (show idx) <> "\"][\"" <> name <> "\"].val"

jsonAccessorCSharp :: Int -> Text -> Text
jsonAccessorCSharp idx name = "_TestVal(\"" <> T.pack (show idx) <> "\", \"" <> name <> "\")"

jsonAccessorPython :: Int -> Text -> Text
jsonAccessorPython idx name = "_test_val(\"" <> T.pack (show idx) <> "\", \"" <> name <> "\")"

jsonAccessorRuby :: Int -> Text -> Text
jsonAccessorRuby idx name = "_test_val(\"" <> T.pack (show idx) <> "\", \"" <> name <> "\")"

jsonAccessorGo :: Int -> Text -> Text
jsonAccessorGo idx name = "testVal(\"" <> T.pack (show idx) <> "\", \"" <> name <> "\")"

jsonAccessorTypeScript :: Int -> Text -> Text
jsonAccessorTypeScript idx name = "testVal(\"" <> T.pack (show idx) <> "\", \"" <> name <> "\")"

jsonAccessorDart :: Int -> Text -> Text
jsonAccessorDart idx name = "testVal(\"" <> T.pack (show idx) <> "\", \"" <> name <> "\")"

jsonAccessorSwift :: Int -> Text -> Text
jsonAccessorSwift idx name = "testVal(\"" <> T.pack (show idx) <> "\", \"" <> name <> "\")"

jsonAccessorRust :: Int -> Text -> Text
jsonAccessorRust idx name = "_TEST_.get(\"" <> T.pack (show idx) <> "\").unwrap().get(\"" <> name <> "\").unwrap().val.clone()"

jsonAccessorKotlin :: Int -> Text -> Text
jsonAccessorKotlin idx name = "testVal(\"" <> T.pack (show idx) <> "\", \"" <> name <> "\")"

buildParamPrelude :: Language -> Int -> M.Map Text Types.TestParams -> [Text]
buildParamPrelude lang idx params = map (\(name, p) -> renderParamDecl lang idx name p) (M.toList params)

renderParamDecl :: Language -> Int -> Text -> Types.TestParams -> Text
renderParamDecl Java idx name params = renderJavaDecl (jsonVarName idx name) (jsonAccessorJava idx name) params
renderParamDecl Cpp idx name params = renderCppDecl (jsonVarName idx name) (jsonAccessorCpp idx name) params
renderParamDecl CSharp idx name params = renderCSharpDecl (jsonVarName idx name) (jsonAccessorCSharp idx name) params
renderParamDecl Python3 idx name params = renderPythonDecl (jsonVarName idx name) (jsonAccessorPython idx name) params
renderParamDecl Python2 idx name params = renderPythonDecl (jsonVarName idx name) (jsonAccessorPython idx name) params
renderParamDecl Ruby idx name params = renderRubyDecl (jsonVarName idx name) (jsonAccessorRuby idx name) params
renderParamDecl Go idx name params = renderGoDecl (jsonVarName idx name) (jsonAccessorGo idx name) params
renderParamDecl TypeScript idx name params = renderTypeScriptDecl (jsonVarName idx name) (jsonAccessorTypeScript idx name) params
renderParamDecl Dart idx name params = renderDartDecl (jsonVarName idx name) (jsonAccessorDart idx name) params
renderParamDecl Swift idx name params = renderSwiftDecl (jsonVarName idx name) (jsonAccessorSwift idx name) params
renderParamDecl Rust idx name params = renderRustDecl (jsonVarName idx name) (jsonAccessorRust idx name) params
renderParamDecl Kotlin idx name params = renderKotlinDecl (jsonVarName idx name) (jsonAccessorKotlin idx name) params
renderParamDecl _ _ _ _ = error "Unsupported language for json params"

renderJavaDecl :: Text -> Text -> Types.TestParams -> Text
renderJavaDecl name accessor params = javaType params <> " " <> name <> " = " <> javaExpr accessor params <> ";"

javaType :: Types.TestParams -> Text
javaType (Types.TestParams Types.TPTInt _) = "int"
javaType (Types.TestParams Types.TPTLong _) = "long"
javaType (Types.TestParams Types.TPTDouble _) = "double"
javaType (Types.TestParams Types.TPTFloat _) = "float"
javaType (Types.TestParams Types.TPTString _) = "String"
javaType (Types.TestParams Types.TPTChar _) = "char"
javaType (Types.TestParams Types.TPTBool _) = "boolean"
javaType (Types.TestParams Types.TPTArray (Just items)) = javaType items <> "[]"
javaType (Types.TestParams Types.TPTListNode _) = "ListNode"
javaType (Types.TestParams Types.TPTTreeNode _) = "TreeNode"
javaType _ = error "Unsupported java param type"

javaExpr :: Text -> Types.TestParams -> Text
javaExpr accessor (Types.TestParams Types.TPTInt _) = "Json.toInt(" <> accessor <> ")"
javaExpr accessor (Types.TestParams Types.TPTLong _) = "Json.toLong(" <> accessor <> ")"
javaExpr accessor (Types.TestParams Types.TPTDouble _) = "Json.toDouble(" <> accessor <> ")"
javaExpr accessor (Types.TestParams Types.TPTFloat _) = "Json.toFloat(" <> accessor <> ")"
javaExpr accessor (Types.TestParams Types.TPTString _) = "Json.toStringValue(" <> accessor <> ")"
javaExpr accessor (Types.TestParams Types.TPTChar _) = "Json.toChar(" <> accessor <> ")"
javaExpr accessor (Types.TestParams Types.TPTBool _) = "Json.toBool(" <> accessor <> ")"
javaExpr accessor (Types.TestParams Types.TPTArray (Just items)) =
  case Types.tpaType items of
    Types.TPTInt -> "Json.toIntArray(" <> accessor <> ")"
    Types.TPTLong -> "Json.toLongArray(" <> accessor <> ")"
    Types.TPTDouble -> "Json.toDoubleArray(" <> accessor <> ")"
    Types.TPTFloat -> "Json.toFloatArray(" <> accessor <> ")"
    Types.TPTString -> "Json.toStringArray(" <> accessor <> ")"
    Types.TPTChar -> "Json.toCharArray(" <> accessor <> ")"
    Types.TPTBool -> "Json.toBoolArray(" <> accessor <> ")"
    Types.TPTArray ->
      case fmap Types.tpaType (Types.tpaItems items) of
        Just Types.TPTInt -> "Json.toIntMatrix(" <> accessor <> ")"
        Just Types.TPTLong -> "Json.toLongMatrix(" <> accessor <> ")"
        Just Types.TPTDouble -> "Json.toDoubleMatrix(" <> accessor <> ")"
        Just Types.TPTFloat -> "Json.toFloatMatrix(" <> accessor <> ")"
        Just Types.TPTString -> "Json.toStringMatrix(" <> accessor <> ")"
        Just Types.TPTChar -> "Json.toCharMatrix(" <> accessor <> ")"
        Just Types.TPTBool -> "Json.toBoolMatrix(" <> accessor <> ")"
        _ -> error "Unsupported java nested array type"
    _ -> error "Unsupported java array item type"
javaExpr accessor (Types.TestParams Types.TPTListNode _) = "ListNode.toListNode(Json.toIntArray(" <> accessor <> "))"
javaExpr accessor (Types.TestParams Types.TPTTreeNode _) = "TreeNode.toTreeNode(Json.toIntegerArray(" <> accessor <> "))"
javaExpr _ _ = error "Unsupported java param type"

renderCppDecl :: Text -> Text -> Types.TestParams -> Text
renderCppDecl name accessor params = cppType params <> " " <> name <> " = " <> cppExpr accessor params <> ";"

cppType :: Types.TestParams -> Text
cppType (Types.TestParams Types.TPTInt _) = "int"
cppType (Types.TestParams Types.TPTLong _) = "long long"
cppType (Types.TestParams Types.TPTDouble _) = "double"
cppType (Types.TestParams Types.TPTFloat _) = "float"
cppType (Types.TestParams Types.TPTString _) = "string"
cppType (Types.TestParams Types.TPTChar _) = "char"
cppType (Types.TestParams Types.TPTBool _) = "bool"
cppType (Types.TestParams Types.TPTArray (Just items)) = "vector<" <> cppInnerType items <> ">"
cppType (Types.TestParams Types.TPTListNode _) = "ListNode*"
cppType (Types.TestParams Types.TPTTreeNode _) = "TreeNode*"
cppType _ = error "Unsupported cpp param type"

cppInnerType :: Types.TestParams -> Text
cppInnerType (Types.TestParams Types.TPTInt _) = "int"
cppInnerType (Types.TestParams Types.TPTLong _) = "long long"
cppInnerType (Types.TestParams Types.TPTDouble _) = "double"
cppInnerType (Types.TestParams Types.TPTFloat _) = "float"
cppInnerType (Types.TestParams Types.TPTString _) = "string"
cppInnerType (Types.TestParams Types.TPTChar _) = "char"
cppInnerType (Types.TestParams Types.TPTBool _) = "bool"
cppInnerType (Types.TestParams Types.TPTArray (Just items)) = "vector<" <> cppInnerType items <> ">"
cppInnerType _ = error "Unsupported cpp inner type"

cppExpr :: Text -> Types.TestParams -> Text
cppExpr accessor (Types.TestParams Types.TPTInt _) = "jsonToInt(" <> accessor <> ")"
cppExpr accessor (Types.TestParams Types.TPTLong _) = "jsonToLong(" <> accessor <> ")"
cppExpr accessor (Types.TestParams Types.TPTDouble _) = "jsonToDouble(" <> accessor <> ")"
cppExpr accessor (Types.TestParams Types.TPTFloat _) = "jsonToFloat(" <> accessor <> ")"
cppExpr accessor (Types.TestParams Types.TPTString _) = "jsonToString(" <> accessor <> ")"
cppExpr accessor (Types.TestParams Types.TPTChar _) = "jsonToChar(" <> accessor <> ")"
cppExpr accessor (Types.TestParams Types.TPTBool _) = "jsonToBool(" <> accessor <> ")"
cppExpr accessor (Types.TestParams Types.TPTArray (Just items)) =
  case Types.tpaType items of
    Types.TPTInt -> "jsonToIntArray(" <> accessor <> ")"
    Types.TPTLong -> "jsonToLongArray(" <> accessor <> ")"
    Types.TPTDouble -> "jsonToDoubleArray(" <> accessor <> ")"
    Types.TPTFloat -> "jsonToFloatArray(" <> accessor <> ")"
    Types.TPTString -> "jsonToStringArray(" <> accessor <> ")"
    Types.TPTBool -> "jsonToBoolArray(" <> accessor <> ")"
    Types.TPTChar -> "jsonToCharArray(" <> accessor <> ")"
    Types.TPTArray ->
      case fmap Types.tpaType (Types.tpaItems items) of
        Just Types.TPTInt -> "jsonToIntMatrix(" <> accessor <> ")"
        Just Types.TPTLong -> "jsonToLongMatrix(" <> accessor <> ")"
        Just Types.TPTDouble -> "jsonToDoubleMatrix(" <> accessor <> ")"
        Just Types.TPTFloat -> "jsonToFloatMatrix(" <> accessor <> ")"
        Just Types.TPTString -> "jsonToStringMatrix(" <> accessor <> ")"
        Just Types.TPTBool -> "jsonToBoolMatrix(" <> accessor <> ")"
        Just Types.TPTChar -> "jsonToCharMatrix(" <> accessor <> ")"
        _ -> error "Unsupported cpp nested array type"
    _ -> error "Unsupported cpp array item type"
cppExpr accessor (Types.TestParams Types.TPTListNode _) = "toListNode(jsonToIntArray(" <> accessor <> "))"
cppExpr accessor (Types.TestParams Types.TPTTreeNode _) = "toTreeNode(jsonToOptionalIntArray(" <> accessor <> "))"
cppExpr _ _ = error "Unsupported cpp param type"

renderCSharpDecl :: Text -> Text -> Types.TestParams -> Text
renderCSharpDecl name accessor params = csharpType params <> " " <> name <> " = " <> csharpExpr accessor params <> ";"

csharpType :: Types.TestParams -> Text
csharpType (Types.TestParams Types.TPTInt _) = "int"
csharpType (Types.TestParams Types.TPTLong _) = "long"
csharpType (Types.TestParams Types.TPTDouble _) = "double"
csharpType (Types.TestParams Types.TPTFloat _) = "float"
csharpType (Types.TestParams Types.TPTString _) = "string"
csharpType (Types.TestParams Types.TPTChar _) = "char"
csharpType (Types.TestParams Types.TPTBool _) = "bool"
csharpType (Types.TestParams Types.TPTArray (Just items)) = csharpType items <> "[]"
csharpType (Types.TestParams Types.TPTListNode _) = "ListNode"
csharpType (Types.TestParams Types.TPTTreeNode _) = "TreeNode"
csharpType _ = error "Unsupported csharp param type"

csharpExpr :: Text -> Types.TestParams -> Text
csharpExpr accessor (Types.TestParams Types.TPTInt _) = "ToInt(" <> accessor <> ")"
csharpExpr accessor (Types.TestParams Types.TPTLong _) = "ToLong(" <> accessor <> ")"
csharpExpr accessor (Types.TestParams Types.TPTDouble _) = "ToDouble(" <> accessor <> ")"
csharpExpr accessor (Types.TestParams Types.TPTFloat _) = "ToFloat(" <> accessor <> ")"
csharpExpr accessor (Types.TestParams Types.TPTString _) = "ToStringValue(" <> accessor <> ")"
csharpExpr accessor (Types.TestParams Types.TPTChar _) = "ToChar(" <> accessor <> ")"
csharpExpr accessor (Types.TestParams Types.TPTBool _) = "ToBool(" <> accessor <> ")"
csharpExpr accessor (Types.TestParams Types.TPTArray (Just items)) =
  case Types.tpaType items of
    Types.TPTInt -> "ToIntArray(" <> accessor <> ")"
    Types.TPTLong -> "ToLongArray(" <> accessor <> ")"
    Types.TPTDouble -> "ToDoubleArray(" <> accessor <> ")"
    Types.TPTFloat -> "ToFloatArray(" <> accessor <> ")"
    Types.TPTString -> "ToStringArray(" <> accessor <> ")"
    Types.TPTChar -> "ToCharArray(" <> accessor <> ")"
    Types.TPTBool -> "ToBoolArray(" <> accessor <> ")"
    Types.TPTArray ->
      case fmap Types.tpaType (Types.tpaItems items) of
        Just Types.TPTInt -> "ToIntMatrix(" <> accessor <> ")"
        Just Types.TPTLong -> "ToLongMatrix(" <> accessor <> ")"
        Just Types.TPTDouble -> "ToDoubleMatrix(" <> accessor <> ")"
        Just Types.TPTFloat -> "ToFloatMatrix(" <> accessor <> ")"
        Just Types.TPTString -> "ToStringMatrix(" <> accessor <> ")"
        Just Types.TPTChar -> "ToCharMatrix(" <> accessor <> ")"
        Just Types.TPTBool -> "ToBoolMatrix(" <> accessor <> ")"
        _ -> error "Unsupported csharp nested array type"
    _ -> error "Unsupported csharp array item type"
csharpExpr accessor (Types.TestParams Types.TPTListNode _) = "ListNode.ToListNode(ToIntArray(" <> accessor <> "))"
csharpExpr accessor (Types.TestParams Types.TPTTreeNode _) = "TreeNode.ToTreeNode(ToNullableIntArray(" <> accessor <> "))"
csharpExpr _ _ = error "Unsupported csharp param type"

renderPythonDecl :: Text -> Text -> Types.TestParams -> Text
renderPythonDecl name accessor params = name <> " = " <> pythonExpr accessor params

pythonExpr :: Text -> Types.TestParams -> Text
pythonExpr accessor (Types.TestParams Types.TPTListNode _) = "to_list_node(" <> accessor <> ")"
pythonExpr accessor (Types.TestParams Types.TPTTreeNode _) = "to_tree_node(" <> accessor <> ")"
pythonExpr accessor _ = accessor

renderRubyDecl :: Text -> Text -> Types.TestParams -> Text
renderRubyDecl name accessor params = name <> " = " <> rubyExpr accessor params

rubyExpr :: Text -> Types.TestParams -> Text
rubyExpr accessor (Types.TestParams Types.TPTListNode _) = "to_list_node(" <> accessor <> ")"
rubyExpr accessor (Types.TestParams Types.TPTTreeNode _) = "to_tree_node(" <> accessor <> ")"
rubyExpr accessor _ = accessor

renderGoDecl :: Text -> Text -> Types.TestParams -> Text
renderGoDecl name accessor params = name <> " := " <> goExpr accessor params

goExpr :: Text -> Types.TestParams -> Text
goExpr accessor (Types.TestParams Types.TPTInt _) = "toInt(" <> accessor <> ")"
goExpr accessor (Types.TestParams Types.TPTLong _) = "toLongValue(" <> accessor <> ")"
goExpr accessor (Types.TestParams Types.TPTDouble _) = "toFloat64Value(" <> accessor <> ")"
goExpr accessor (Types.TestParams Types.TPTFloat _) = "float32(toFloat64Value(" <> accessor <> "))"
goExpr accessor (Types.TestParams Types.TPTString _) = "toStringValue(" <> accessor <> ")"
goExpr accessor (Types.TestParams Types.TPTChar _) = "toByteValue(" <> accessor <> ")"
goExpr accessor (Types.TestParams Types.TPTBool _) = "toBoolValue(" <> accessor <> ")"
goExpr accessor (Types.TestParams Types.TPTArray (Just items)) =
  case Types.tpaType items of
    Types.TPTInt -> "toIntArrayValue(" <> accessor <> ")"
    Types.TPTLong -> "toLongArrayValue(" <> accessor <> ")"
    Types.TPTDouble -> "toDoubleArrayValue(" <> accessor <> ")"
    Types.TPTFloat -> "toFloatArrayValue(" <> accessor <> ")"
    Types.TPTString -> "toStringArrayValue(" <> accessor <> ")"
    Types.TPTChar -> "toByteArrayValue(" <> accessor <> ")"
    Types.TPTBool -> "toBoolArrayValue(" <> accessor <> ")"
    Types.TPTArray ->
      case fmap Types.tpaType (Types.tpaItems items) of
        Just Types.TPTInt -> "toIntMatrixValue(" <> accessor <> ")"
        Just Types.TPTLong -> "toLongMatrixValue(" <> accessor <> ")"
        Just Types.TPTDouble -> "toDoubleMatrixValue(" <> accessor <> ")"
        Just Types.TPTFloat -> "toFloatMatrixValue(" <> accessor <> ")"
        Just Types.TPTString -> "toStringMatrixValue(" <> accessor <> ")"
        Just Types.TPTChar -> "toByteMatrixValue(" <> accessor <> ")"
        Just Types.TPTBool -> "toBoolMatrixValue(" <> accessor <> ")"
        _ -> error "Unsupported go nested array type"
    _ -> error "Unsupported go array item type"
goExpr accessor (Types.TestParams Types.TPTListNode _) = "toListNode(toIntArrayValue(" <> accessor <> "))"
goExpr accessor (Types.TestParams Types.TPTTreeNode _) = "toTreeNode(toInterfaceArrayValue(" <> accessor <> "))"
goExpr _ _ = error "Unsupported go param type"

renderTypeScriptDecl :: Text -> Text -> Types.TestParams -> Text
renderTypeScriptDecl name accessor params = "const " <> name <> " = " <> typeScriptExpr accessor params <> ";"

typeScriptExpr :: Text -> Types.TestParams -> Text
typeScriptExpr accessor (Types.TestParams Types.TPTInt _) = "Number(" <> accessor <> ")"
typeScriptExpr accessor (Types.TestParams Types.TPTLong _) = "Number(" <> accessor <> ")"
typeScriptExpr accessor (Types.TestParams Types.TPTDouble _) = "Number(" <> accessor <> ")"
typeScriptExpr accessor (Types.TestParams Types.TPTFloat _) = "Number(" <> accessor <> ")"
typeScriptExpr accessor (Types.TestParams Types.TPTString _) = "String(" <> accessor <> ")"
typeScriptExpr accessor (Types.TestParams Types.TPTChar _) = "String(" <> accessor <> ")"
typeScriptExpr accessor (Types.TestParams Types.TPTBool _) = "Boolean(" <> accessor <> ")"
typeScriptExpr accessor (Types.TestParams Types.TPTArray (Just items)) =
  case Types.tpaType items of
    Types.TPTInt -> accessor <> " as number[]"
    Types.TPTLong -> accessor <> " as number[]"
    Types.TPTDouble -> accessor <> " as number[]"
    Types.TPTFloat -> accessor <> " as number[]"
    Types.TPTString -> accessor <> " as string[]"
    Types.TPTChar -> accessor <> " as string[]"
    Types.TPTBool -> accessor <> " as boolean[]"
    Types.TPTArray ->
      case fmap Types.tpaType (Types.tpaItems items) of
        Just Types.TPTInt -> accessor <> " as number[][]"
        Just Types.TPTLong -> accessor <> " as number[][]"
        Just Types.TPTDouble -> accessor <> " as number[][]"
        Just Types.TPTFloat -> accessor <> " as number[][]"
        Just Types.TPTString -> accessor <> " as string[][]"
        Just Types.TPTChar -> accessor <> " as string[][]"
        Just Types.TPTBool -> accessor <> " as boolean[][]"
        _ -> error "Unsupported typescript nested array type"
    _ -> error "Unsupported typescript array item type"
typeScriptExpr accessor (Types.TestParams Types.TPTListNode _) = "toListNode(" <> accessor <> " as number[])"
typeScriptExpr accessor (Types.TestParams Types.TPTTreeNode _) = "toTreeNode(" <> accessor <> " as (number | null)[])"
typeScriptExpr _ _ = error "Unsupported typescript param type"

renderDartDecl :: Text -> Text -> Types.TestParams -> Text
renderDartDecl name accessor params = "final " <> name <> " = " <> dartExpr accessor params <> ";"

dartExpr :: Text -> Types.TestParams -> Text
dartExpr accessor (Types.TestParams Types.TPTInt _) = "toIntValue(" <> accessor <> ")"
dartExpr accessor (Types.TestParams Types.TPTLong _) = "toIntValue(" <> accessor <> ")"
dartExpr accessor (Types.TestParams Types.TPTDouble _) = "toDoubleValue(" <> accessor <> ")"
dartExpr accessor (Types.TestParams Types.TPTFloat _) = "toDoubleValue(" <> accessor <> ").toDouble()"
dartExpr accessor (Types.TestParams Types.TPTString _) = "toStringValue(" <> accessor <> ")"
dartExpr accessor (Types.TestParams Types.TPTChar _) = "toStringValue(" <> accessor <> ")"
dartExpr accessor (Types.TestParams Types.TPTBool _) = "toBoolValue(" <> accessor <> ")"
dartExpr accessor (Types.TestParams Types.TPTArray (Just items)) =
  case Types.tpaType items of
    Types.TPTInt -> "toIntArrayValue(" <> accessor <> ")"
    Types.TPTLong -> "toIntArrayValue(" <> accessor <> ")"
    Types.TPTDouble -> "toDoubleArrayValue(" <> accessor <> ")"
    Types.TPTFloat -> "toDoubleArrayValue(" <> accessor <> ")"
    Types.TPTString -> "toStringArrayValue(" <> accessor <> ")"
    Types.TPTChar -> "toStringArrayValue(" <> accessor <> ")"
    Types.TPTBool -> "toBoolArrayValue(" <> accessor <> ")"
    Types.TPTArray ->
      case fmap Types.tpaType (Types.tpaItems items) of
        Just Types.TPTInt -> "toIntMatrixValue(" <> accessor <> ")"
        Just Types.TPTLong -> "toIntMatrixValue(" <> accessor <> ")"
        Just Types.TPTDouble -> "toDoubleMatrixValue(" <> accessor <> ")"
        Just Types.TPTFloat -> "toDoubleMatrixValue(" <> accessor <> ")"
        Just Types.TPTString -> "toStringMatrixValue(" <> accessor <> ")"
        Just Types.TPTChar -> "toStringMatrixValue(" <> accessor <> ")"
        Just Types.TPTBool -> "toBoolMatrixValue(" <> accessor <> ")"
        _ -> error "Unsupported dart nested array type"
    _ -> error "Unsupported dart array item type"
dartExpr accessor (Types.TestParams Types.TPTListNode _) = "to_list_node(toIntArrayValue(" <> accessor <> "))"
dartExpr accessor (Types.TestParams Types.TPTTreeNode _) = "to_tree_node(toDynamicListValue(" <> accessor <> "))"
dartExpr _ _ = error "Unsupported dart param type"

renderSwiftDecl :: Text -> Text -> Types.TestParams -> Text
renderSwiftDecl name accessor params = "let " <> name <> ": " <> swiftType params <> " = " <> swiftExpr accessor params

swiftType :: Types.TestParams -> Text
swiftType (Types.TestParams Types.TPTInt _) = "Int"
swiftType (Types.TestParams Types.TPTLong _) = "Int"
swiftType (Types.TestParams Types.TPTDouble _) = "Double"
swiftType (Types.TestParams Types.TPTFloat _) = "Float"
swiftType (Types.TestParams Types.TPTString _) = "String"
swiftType (Types.TestParams Types.TPTChar _) = "Character"
swiftType (Types.TestParams Types.TPTBool _) = "Bool"
swiftType (Types.TestParams Types.TPTArray (Just items)) =
  case Types.tpaType items of
    Types.TPTInt -> "[Int]"
    Types.TPTLong -> "[Int]"
    Types.TPTDouble -> "[Double]"
    Types.TPTFloat -> "[Float]"
    Types.TPTString -> "[String]"
    Types.TPTChar -> "[Character]"
    Types.TPTBool -> "[Bool]"
    Types.TPTArray ->
      case fmap Types.tpaType (Types.tpaItems items) of
        Just Types.TPTInt -> "[[Int]]"
        Just Types.TPTLong -> "[[Int]]"
        Just Types.TPTDouble -> "[[Double]]"
        Just Types.TPTFloat -> "[[Float]]"
        Just Types.TPTString -> "[[String]]"
        Just Types.TPTChar -> "[[Character]]"
        Just Types.TPTBool -> "[[Bool]]"
        _ -> error "Unsupported swift nested array type"
    _ -> error "Unsupported swift array item type"
swiftType (Types.TestParams Types.TPTListNode _) = "ListNode?"
swiftType (Types.TestParams Types.TPTTreeNode _) = "TreeNode?"
swiftType _ = error "Unsupported swift param type"

swiftExpr :: Text -> Types.TestParams -> Text
swiftExpr accessor (Types.TestParams Types.TPTInt _) = "anyToInt(" <> accessor <> ")"
swiftExpr accessor (Types.TestParams Types.TPTLong _) = "anyToInt(" <> accessor <> ")"
swiftExpr accessor (Types.TestParams Types.TPTDouble _) = "anyToDouble(" <> accessor <> ")"
swiftExpr accessor (Types.TestParams Types.TPTFloat _) = "anyToFloat(" <> accessor <> ")"
swiftExpr accessor (Types.TestParams Types.TPTString _) = "anyToString(" <> accessor <> ")"
swiftExpr accessor (Types.TestParams Types.TPTChar _) = "Character(anyToString(" <> accessor <> "))"
swiftExpr accessor (Types.TestParams Types.TPTBool _) = "anyToBool(" <> accessor <> ")"
swiftExpr accessor (Types.TestParams Types.TPTArray (Just items)) =
  case Types.tpaType items of
    Types.TPTInt -> "anyToIntArray(" <> accessor <> ")"
    Types.TPTLong -> "anyToIntArray(" <> accessor <> ")"
    Types.TPTDouble -> "anyToDoubleArray(" <> accessor <> ")"
    Types.TPTFloat -> "anyToFloatArray(" <> accessor <> ")"
    Types.TPTString -> "anyToStringArray(" <> accessor <> ")"
    Types.TPTChar -> "anyToCharArray(" <> accessor <> ")"
    Types.TPTBool -> "anyToBoolArray(" <> accessor <> ")"
    Types.TPTArray ->
      case fmap Types.tpaType (Types.tpaItems items) of
        Just Types.TPTInt -> "anyToIntMatrix(" <> accessor <> ")"
        Just Types.TPTLong -> "anyToIntMatrix(" <> accessor <> ")"
        Just Types.TPTDouble -> "anyToDoubleMatrix(" <> accessor <> ")"
        Just Types.TPTFloat -> "anyToFloatMatrix(" <> accessor <> ")"
        Just Types.TPTString -> "anyToStringMatrix(" <> accessor <> ")"
        Just Types.TPTChar -> "anyToCharMatrix(" <> accessor <> ")"
        Just Types.TPTBool -> "anyToBoolMatrix(" <> accessor <> ")"
        _ -> error "Unsupported swift nested array type"
    _ -> error "Unsupported swift array item type"
swiftExpr accessor (Types.TestParams Types.TPTListNode _) = "to_list_node(anyToIntArray(" <> accessor <> "))"
swiftExpr accessor (Types.TestParams Types.TPTTreeNode _) = "to_tree_node(anyToOptionalIntArray(" <> accessor <> "))"
swiftExpr _ _ = error "Unsupported swift param type"

renderRustDecl :: Text -> Text -> Types.TestParams -> Text
renderRustDecl name accessor params = "let " <> name <> ": " <> rustType params <> " = " <> rustExpr accessor params <> ";"

rustType :: Types.TestParams -> Text
rustType (Types.TestParams Types.TPTInt _) = "i32"
rustType (Types.TestParams Types.TPTLong _) = "i64"
rustType (Types.TestParams Types.TPTDouble _) = "f64"
rustType (Types.TestParams Types.TPTFloat _) = "f32"
rustType (Types.TestParams Types.TPTString _) = "String"
rustType (Types.TestParams Types.TPTChar _) = "char"
rustType (Types.TestParams Types.TPTBool _) = "bool"
rustType (Types.TestParams Types.TPTArray (Just items)) =
  case Types.tpaType items of
    Types.TPTInt -> "Vec<i32>"
    Types.TPTLong -> "Vec<i64>"
    Types.TPTDouble -> "Vec<f64>"
    Types.TPTFloat -> "Vec<f32>"
    Types.TPTString -> "Vec<String>"
    Types.TPTChar -> "Vec<char>"
    Types.TPTBool -> "Vec<bool>"
    Types.TPTArray ->
      case fmap Types.tpaType (Types.tpaItems items) of
        Just Types.TPTInt -> "Vec<Vec<i32>>"
        Just Types.TPTLong -> "Vec<Vec<i64>>"
        Just Types.TPTDouble -> "Vec<Vec<f64>>"
        Just Types.TPTFloat -> "Vec<Vec<f32>>"
        Just Types.TPTString -> "Vec<Vec<String>>"
        Just Types.TPTChar -> "Vec<Vec<char>>"
        Just Types.TPTBool -> "Vec<Vec<bool>>"
        _ -> error "Unsupported rust nested array type"
    _ -> error "Unsupported rust array item type"
rustType (Types.TestParams Types.TPTListNode _) = "Option<Box<ListNode>>"
rustType (Types.TestParams Types.TPTTreeNode _) = "Option<Rc<RefCell<TreeNode>>>"
rustType _ = error "Unsupported rust param type"

rustExpr :: Text -> Types.TestParams -> Text
rustExpr accessor (Types.TestParams Types.TPTInt _) = "json_to_i32(&" <> accessor <> ")"
rustExpr accessor (Types.TestParams Types.TPTLong _) = "json_to_i64(&" <> accessor <> ")"
rustExpr accessor (Types.TestParams Types.TPTDouble _) = "json_to_f64(&" <> accessor <> ")"
rustExpr accessor (Types.TestParams Types.TPTFloat _) = "json_to_f32(&" <> accessor <> ")"
rustExpr accessor (Types.TestParams Types.TPTString _) = "json_to_string(&" <> accessor <> ")"
rustExpr accessor (Types.TestParams Types.TPTChar _) = "json_to_char(&" <> accessor <> ")"
rustExpr accessor (Types.TestParams Types.TPTBool _) = "json_to_bool(&" <> accessor <> ")"
rustExpr accessor (Types.TestParams Types.TPTArray (Just items)) =
  case Types.tpaType items of
    Types.TPTInt -> "json_to_i32_array(&" <> accessor <> ")"
    Types.TPTLong -> "json_to_i64_array(&" <> accessor <> ")"
    Types.TPTDouble -> "json_to_f64_array(&" <> accessor <> ")"
    Types.TPTFloat -> "json_to_f32_array(&" <> accessor <> ")"
    Types.TPTString -> "json_to_string_array(&" <> accessor <> ")"
    Types.TPTChar -> "json_to_char_array(&" <> accessor <> ")"
    Types.TPTBool -> "json_to_bool_array(&" <> accessor <> ")"
    Types.TPTArray ->
      case fmap Types.tpaType (Types.tpaItems items) of
        Just Types.TPTInt -> "json_to_i32_matrix(&" <> accessor <> ")"
        Just Types.TPTLong -> "json_to_i64_matrix(&" <> accessor <> ")"
        Just Types.TPTDouble -> "json_to_f64_matrix(&" <> accessor <> ")"
        Just Types.TPTFloat -> "json_to_f32_matrix(&" <> accessor <> ")"
        Just Types.TPTString -> "json_to_string_matrix(&" <> accessor <> ")"
        Just Types.TPTChar -> "json_to_char_matrix(&" <> accessor <> ")"
        Just Types.TPTBool -> "json_to_bool_matrix(&" <> accessor <> ")"
        _ -> error "Unsupported rust nested array type"
    _ -> error "Unsupported rust array item type"
rustExpr accessor (Types.TestParams Types.TPTListNode _) = "ListNode::to_list_node(json_to_i32_array(&" <> accessor <> "))"
rustExpr accessor (Types.TestParams Types.TPTTreeNode _) = "TreeNode::to_tree_node(json_to_optional_i32_array(&" <> accessor <> "))"
rustExpr _ _ = error "Unsupported rust param type"

renderKotlinDecl :: Text -> Text -> Types.TestParams -> Text
renderKotlinDecl name accessor params = "val " <> name <> ": " <> kotlinType params <> " = " <> kotlinExpr accessor params

kotlinType :: Types.TestParams -> Text
kotlinType (Types.TestParams Types.TPTInt _) = "Int"
kotlinType (Types.TestParams Types.TPTLong _) = "Long"
kotlinType (Types.TestParams Types.TPTDouble _) = "Double"
kotlinType (Types.TestParams Types.TPTFloat _) = "Float"
kotlinType (Types.TestParams Types.TPTString _) = "String"
kotlinType (Types.TestParams Types.TPTChar _) = "Char"
kotlinType (Types.TestParams Types.TPTBool _) = "Boolean"
kotlinType (Types.TestParams Types.TPTArray (Just items)) =
  case Types.tpaType items of
    Types.TPTInt -> "IntArray"
    Types.TPTLong -> "LongArray"
    Types.TPTDouble -> "DoubleArray"
    Types.TPTFloat -> "FloatArray"
    Types.TPTString -> "Array<String>"
    Types.TPTChar -> "CharArray"
    Types.TPTBool -> "BooleanArray"
    Types.TPTArray ->
      case fmap Types.tpaType (Types.tpaItems items) of
        Just Types.TPTInt -> "Array<IntArray>"
        Just Types.TPTLong -> "Array<LongArray>"
        Just Types.TPTDouble -> "Array<DoubleArray>"
        Just Types.TPTFloat -> "Array<FloatArray>"
        Just Types.TPTString -> "Array<Array<String>>"
        Just Types.TPTChar -> "Array<CharArray>"
        Just Types.TPTBool -> "Array<BooleanArray>"
        _ -> error "Unsupported kotlin nested array type"
    _ -> error "Unsupported kotlin array item type"
kotlinType (Types.TestParams Types.TPTListNode _) = "ListNode?"
kotlinType (Types.TestParams Types.TPTTreeNode _) = "TreeNode?"
kotlinType _ = error "Unsupported kotlin param type"

kotlinExpr :: Text -> Types.TestParams -> Text
kotlinExpr accessor (Types.TestParams Types.TPTInt _) = "toIntValue(" <> accessor <> ")"
kotlinExpr accessor (Types.TestParams Types.TPTLong _) = "toLongValue(" <> accessor <> ")"
kotlinExpr accessor (Types.TestParams Types.TPTDouble _) = "toDoubleValue(" <> accessor <> ")"
kotlinExpr accessor (Types.TestParams Types.TPTFloat _) = "toFloatValue(" <> accessor <> ")"
kotlinExpr accessor (Types.TestParams Types.TPTString _) = "toStringValue(" <> accessor <> ")"
kotlinExpr accessor (Types.TestParams Types.TPTChar _) = "toCharValue(" <> accessor <> ")"
kotlinExpr accessor (Types.TestParams Types.TPTBool _) = "toBoolValue(" <> accessor <> ")"
kotlinExpr accessor (Types.TestParams Types.TPTArray (Just items)) =
  case Types.tpaType items of
    Types.TPTInt -> "toIntArrayValue(" <> accessor <> ")"
    Types.TPTLong -> "toLongArrayValue(" <> accessor <> ")"
    Types.TPTDouble -> "toDoubleArrayValue(" <> accessor <> ")"
    Types.TPTFloat -> "toFloatArrayValue(" <> accessor <> ")"
    Types.TPTString -> "toStringArrayValue(" <> accessor <> ")"
    Types.TPTChar -> "toCharArrayValue(" <> accessor <> ")"
    Types.TPTBool -> "toBoolArrayValue(" <> accessor <> ")"
    Types.TPTArray ->
      case fmap Types.tpaType (Types.tpaItems items) of
        Just Types.TPTInt -> "toIntMatrixValue(" <> accessor <> ")"
        Just Types.TPTLong -> "toLongMatrixValue(" <> accessor <> ")"
        Just Types.TPTDouble -> "toDoubleMatrixValue(" <> accessor <> ")"
        Just Types.TPTFloat -> "toFloatMatrixValue(" <> accessor <> ")"
        Just Types.TPTString -> "toStringMatrixValue(" <> accessor <> ")"
        Just Types.TPTChar -> "toCharMatrixValue(" <> accessor <> ")"
        Just Types.TPTBool -> "toBoolMatrixValue(" <> accessor <> ")"
        _ -> error "Unsupported kotlin nested array type"
    _ -> error "Unsupported kotlin array item type"
kotlinExpr accessor (Types.TestParams Types.TPTListNode _) = "toListNode(toIntArrayValue(" <> accessor <> "))"
kotlinExpr accessor (Types.TestParams Types.TPTTreeNode _) = "toTreeNode(toNullableIntArrayValue(" <> accessor <> "))"
kotlinExpr _ _ = error "Unsupported kotlin param type"

textToJsonValue :: Text -> Value
textToJsonValue raw =
  case decodeStrictText raw of
    Just v -> v
    Nothing -> String raw

generatedInDataToJson :: Types.GeneratedInData -> Value
generatedInDataToJson (Types.GIDIntegral (Types.GIDGenIntegralConst n)) = Number (fromInteger n)
generatedInDataToJson (Types.GIDFloat (Types.GIDGenFloatConst f)) = textToJsonValue (T.pack (show f))
generatedInDataToJson (Types.GIDStr (Types.GIDStrConst s)) = String s
generatedInDataToJson (Types.GIDChar (Types.GIDGenCharConst c)) = String (T.singleton c)
generatedInDataToJson (Types.GIDArr (Types.GIDArrConst xs _)) = Array (V.fromList (map generatedInDataToJson xs))
generatedInDataToJson (Types.GIDBool (Types.GIDGenBoolConst b)) = Bool b
generatedInDataToJson Types.GIDNull = Null
generatedInDataToJson _ = error "Unsupported generated const json conversion"

wrapOracleGenerated :: Types.TestParams -> Text -> Text
wrapOracleGenerated schema rendered =
  case Types.tpaType schema of
    Types.TPTArray -> "[" <> rendered <> "]"
    _ -> rendered

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

splitKotlinCode :: Text -> (Text, Text)
splitKotlinCode code =
  let allLines = T.lines code
      isImport l = "import " `T.isPrefixOf` T.dropWhile (== ' ') l
      (importLines, restLines) = Data.List.partition isImport allLines
   in (T.unlines importLines, T.unlines restLines)

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
