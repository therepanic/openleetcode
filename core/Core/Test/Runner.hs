{-# LANGUAGE OverloadedStrings #-}

module Core.Test.Runner where

import Control.Applicative ((<|>))
import Control.Exception (Exception, SomeException, displayException, handle, throwIO, try)
import Core.Executor.Class qualified as C
import Core.Generator.Class (GenData (..), GenResult, Generator, generate)
import Core.Judge.Class (Judge, judge)
import Core.Judge.Class qualified as J
import Core.Judge.Exact qualified as ETypes
import Core.Judge.IgnoreOrder qualified as ITypes
import Core.Test.Converter (toGenInfo)
import Core.Test.Types qualified as Types
import Core.Types
import Data.IORef (IORef, atomicModifyIORef', newIORef)
import Data.List (intercalate)
import Data.List qualified
import Data.Map qualified as M
import Data.Maybe (fromJust, fromMaybe)
import Data.Text qualified as T
import GHC.Conc (getNumProcessors)
import Text.Read (readMaybe)
import UnliftIO.Async (pooledMapConcurrentlyN)

newtype ShortCircuit = ShortCircuit (Int, TestResult)
  deriving (Show)

instance Exception ShortCircuit

data TestResult = Pass Int | WA (Maybe String) String String | TLE String | RE String String | Internal String deriving (Show, Eq)

data SolutionBatch = SolutionBatch {entryMain :: String, entryTime :: String, sbLang :: Language, solution :: String, utilities :: String, python3Utilities :: String}

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
  n <- getNumProcessors
  doneRef <- newIORef 0
  let casesWithIdx = zip [1 ..] (Types.tsCases suite)
  let total = length casesWithIdx
  let runAndCheck (idx, test) = do
        resOrExc <- try (handleTestCase exec gen batch seed suite test) :: IO (Either SomeException TestResult)
        let res = case resOrExc of
              Left exc -> Internal (displayException exc)
              Right value -> value
        reportDone doneRef total onProgress
        case res of
          Pass _ -> return (idx, res)
          _ -> throwIO (ShortCircuit (idx, res))
  handle (\(ShortCircuit (idx, res)) -> return [(idx, res)]) $
    pooledMapConcurrentlyN n runAndCheck casesWithIdx
  where
    seed = Types.tsSeed suite

reportDone :: IORef Int -> Int -> (Int -> Int -> IO ()) -> IO ()
reportDone doneRef total onProgress = do
  done <- atomicModifyIORef' doneRef (\n -> let n' = n + 1 in (n', n'))
  onProgress done total

handleTestCase ::
  (C.CodeExecutor e, Generator g) =>
  e -> g -> SolutionBatch -> Int -> Types.TestSuite -> Types.TestCase -> IO TestResult
handleTestCase exec gen batch sSeed suite test = do
  let lang = sbLang batch
  let seed = fromMaybe sSeed (Types.tcSeed test)

  let judType = case Types.tcJudge test of
        Just v -> v
        Nothing -> Types.tsJudge suite

  let jud = convertTestJudgeToJudge (Types.jType judType)

  let (inCases, inConsts, inGens) = foldr splitIn ([], [], []) (Types.tcIn test)
        where
          splitIn (var, Types.InCase c) (cs, ks, gs) = ((var, c) : cs, ks, gs)
          splitIn (var, Types.InGenerated gd) (cs, ks, gs) = (cs, ks, (var, gd) : gs)
          splitIn (var, Types.InConst d) (cs, ks, gs) = (cs, (var, d) : ks, gs)

  let generateField (var, gData) =
        let gInfo = toGenInfo gData
            genData = GenData seed gInfo lang
            result = generate gen genData
         in (var, result)

  let genResults = map generateField inGens
  let oracleGenResults = map (generateFieldFor Python3 seed gen) inGens
  let oracleConstResults = map (\(var, d) -> (var, renderConst Python3 d)) inConsts

  let callStr = case Types.tcCall test of
        Just call -> fromJust (M.lookup lang call)
        Nothing -> fromJust (M.lookup lang (Types.teCall $ Types.tsEntry suite))

  let buildContent template =
        let (userImports, userSolution) =
              case lang of
                Java -> splitJavaCode (solution batch)
                Cpp -> splitCppCode (solution batch)
                Rust -> splitRustCode (solution batch)
                _ -> ("", solution batch)
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
            withImports = replaceUniversal "${IMPORTS}" userImports template
            entryWithCall = replaceUniversal "${CALL_SOLUTION}" callStr withImports
            afterGen = foldl (\acc (var, res) -> replaceUniversal ("{" ++ var ++ "}") res acc) entryWithCall genResults
            afterConst = foldl (\acc (var, res) -> replaceUniversal ("{" ++ var ++ "}") res acc) afterGen constResults
            fullCall =
              foldl
                ( \acc (var, val) ->
                    let preparedVal = prepareInValue lang val
                     in replaceUniversal ("{" ++ var ++ "}") preparedVal acc
                )
                afterConst
                inCases
            withRuntime = replaceUniversal "${UTILITIES}" (utilities batch) fullCall
         in replaceUniversal "${SOLUTION}" userSolution withRuntime

  let timeReady = buildContent (entryTime batch)
  timeResponse <-
    C.execute
      exec
      ( C.ExecRequest
          { C.language = lang,
            C.content = timeReady,
            C.runTimeout = Just 1500, -- hardcoded 1.5s
            C.runMemoryLimit = Just (Types.tlMemoryMb (Types.tsLimits suite))
          }
      )
  case timeResponse of
    C.ExecFail err s -> return $ toExecStatus s err ""
    C.ExecSuc tOut -> do
      let (userStdout, tLast) = splitStdout tOut
      let ms = fromMaybe 0 (readMaybe . T.unpack . T.strip . T.pack $ tLast)
      if ms > Types.tlTimeMs (Types.tsLimits suite)
        then
          return $ TLE userStdout
        else do
          let mainReady = buildContent (entryMain batch)
          response <-
            C.execute
              exec
              ( C.ExecRequest
                  { C.language = lang,
                    C.content = mainReady,
                    C.runTimeout = Just 1500, -- hardcoded 1.5s
                    C.runMemoryLimit = Nothing
                  }
              )
          case response of
            C.ExecFail err s -> return $ toExecStatus s err ""
            C.ExecSuc mOut -> do
              let mLast = last (lines mOut)
              case Types.tcOut test of
                Just (Types.OutCase expected) ->
                  let res = judge jud expected mLast
                   in return $ case res of
                        J.Pass -> Pass ms
                        J.Fail _ -> WA (Just expected) mLast userStdout
                Nothing -> case M.lookup Python3 (Types.tsOracle suite) of
                  Nothing -> fail "No expected output and no oracle for Python3"
                  Just oracleSolution -> do
                    let oracleTemplate =
                          "import datetime as _dt\n"
                            ++ "from dataclasses import is_dataclass, asdict\n"
                            ++ "from typing import *\n"
                            ++ python3Utilities batch
                            ++ "\n"
                            ++ Types.checker oracleSolution
                            ++ "\n"
                            ++ "print(to_json("
                            ++ Types.call oracleSolution
                            ++ "))"
                    let cleanResult = T.unpack . T.strip . T.pack $ mLast
                    let oracleReady =
                          let withResult = replaceUniversal "{result}" (show cleanResult) oracleTemplate
                              withCall = replaceUniversal "${CALL_SOLUTION}" callStr withResult
                              afterGen = foldl (\acc (var, res) -> replaceUniversal ("{" ++ var ++ "}") res acc) withCall oracleGenResults
                              afterConst = foldl (\acc (var, res) -> replaceUniversal ("{" ++ var ++ "}") res acc) afterGen oracleConstResults
                              fullCall =
                                foldl
                                  ( \acc (var, val) ->
                                      let preparedVal = prepareInValue Python3 val
                                       in replaceUniversal ("{" ++ var ++ "}") preparedVal acc
                                  )
                                  afterConst
                                  inCases
                           in fullCall
                    oracleResponse <-
                      C.execute
                        exec
                        ( C.ExecRequest
                            { C.language = Python3,
                              C.content = oracleReady,
                              C.runTimeout = Nothing,
                              C.runMemoryLimit = Nothing
                            }
                        )
                    case oracleResponse of
                      C.ExecFail err _ -> fail $ "Oracle execution error: " ++ err
                      C.ExecSuc oracleOut -> do
                        let cleanedOut = filter (`notElem` ['\n', '\r', ' ', '"']) oracleOut
                        if cleanedOut == "true"
                          then return (Pass ms)
                          else return (WA Nothing mLast userStdout)

renderGenResult :: GenResult -> String
renderGenResult r = r

replaceUniversal :: String -> String -> String -> String
replaceUniversal target replacement input =
  let tTarget = T.pack target
      tReplacement = T.pack replacement
      tInput = T.pack input
   in T.unpack $ T.replace tTarget tReplacement tInput

data AnyJudge = ExactJudge ETypes.Exact | IgnoreOrderJudge ITypes.IgnoreOrder

instance Judge AnyJudge where
  judge (ExactJudge j) = judge j
  judge (IgnoreOrderJudge j) = judge j

convertTestJudgeToJudge :: Types.JudgeType -> AnyJudge
convertTestJudgeToJudge Types.Exact = ExactJudge ETypes.Exact
convertTestJudgeToJudge Types.IgnoreOrder = IgnoreOrderJudge ITypes.IgnoreOrder

toExecStatus :: C.ExecStatus -> String -> String -> TestResult
toExecStatus C.TLE _ out = TLE out
toExecStatus C.RE err out = RE err out
toExecStatus (C.Unknown s) err out = RE (s <> " " <> err) out

splitJavaCode :: String -> (String, String)
splitJavaCode code =
  let allLines = lines code
      (importLines, restLines) = Data.List.partition (\l -> "import " `Data.List.isPrefixOf` dropWhile (== ' ') l) allLines
   in (unlines importLines, unlines restLines)

splitCppCode :: String -> (String, String)
splitCppCode code =
  let allLines = lines code
      isInclude l =
        let trimmed = dropWhile (== ' ') l
         in "#include" `Data.List.isPrefixOf` trimmed
      (includeLines, restLines) = Data.List.partition isInclude allLines
   in (unlines includeLines, unlines restLines)

splitRustCode :: String -> (String, String)
splitRustCode code =
  let allLines = lines code
      isUse l = "use " `Data.List.isPrefixOf` dropWhile (== ' ') l
      (useLines, restLines) = Data.List.partition isUse allLines
   in (unlines useLines, unlines restLines)

prepareInValue :: Language -> String -> String
prepareInValue lang val =
  replaceNulls (T.pack val)
  where
    replaceNulls = T.unpack . T.replace "null" (T.pack $ nullLiteral lang)

-- todo: bullshit
expectsRustOptionList :: Language -> String -> String -> Bool
expectsRustOptionList lang callStr var =
  lang == Rust && (("to_tree_node(vec![{" <> var <> "}])") `Data.List.isInfixOf` callStr)

wrapRustOptionList :: String -> String
wrapRustOptionList raw =
  intercalate ", " (map wrapItem nonEmptyItems)
  where
    nonEmptyItems = filter (not . null) (splitByComma raw)
    splitByComma s = map trim (go s "" [])
    go [] current acc = reverse (current : acc)
    go (c : cs) current acc
      | c == ',' = go cs "" (current : acc)
      | otherwise = go cs (current <> [c]) acc
    trim = T.unpack . T.strip . T.pack
    wrapItem x
      | x == "None" = x
      | "Some(" `Data.List.isPrefixOf` x = x
      | otherwise = "Some(" <> x <> ")"

splitStdout :: String -> (String, String)
splitStdout out =
  let allLines = lines out
   in if null allLines
        then ("", "")
        else (unlines (init allLines), last allLines)

generateFieldFor :: (Generator g) => Language -> Int -> g -> (String, Types.GeneratedInData) -> (String, String)
generateFieldFor renderLang seed gen (var, gData) =
  let gInfo = toGenInfo gData
      genData = GenData seed gInfo renderLang
      result = generate gen genData
   in (var, result)

renderNestedArr :: Language -> Maybe Types.GIDArrElemType -> [String] -> String
renderNestedArr lang et rows =
  intercalate ", " (map (wrapArray lang et) rows)

renderConst :: Language -> Types.GeneratedInData -> String
renderConst lang (Types.GIDArr (Types.GIDArrConst xs elemType)) =
  intercalate ", " (map (renderConstArrayItem lang elemType) xs)
renderConst _ (Types.GIDIntegral (Types.GIDGenIntegralConst n)) = show n
renderConst _ (Types.GIDFloat (Types.GIDGenFloatConst f)) = show f
renderConst _ (Types.GIDChar (Types.GIDGenCharConst c)) = show c
renderConst lang Types.GIDNull = nullLiteral lang
renderConst lang (Types.GIDBool (Types.GIDGenBoolConst b)) =
  if lang == Python3 || lang == Python2
    then show b
    else T.unpack . T.toLower . T.pack $ show b
renderConst _ (Types.GIDStr (Types.GIDStrConst s)) = show s
renderConst _ (Types.GIDStr (Types.GIDStrGen _ _)) = error "unsupported"
renderConst _ _ = error "unsupported"

renderConstArrayItem :: Language -> Maybe Types.GIDArrElemType -> Types.GeneratedInData -> String
renderConstArrayItem lang inheritedElemType (Types.GIDArr (Types.GIDArrConst xs elemType)) =
  let et = elemType <|> inheritedElemType
   in wrapArray lang et $ intercalate ", " (map (renderConstArrayItem lang et) xs)
renderConstArrayItem lang _ val = renderConst lang val

wrapArray :: Language -> Maybe Types.GIDArrElemType -> String -> String
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
