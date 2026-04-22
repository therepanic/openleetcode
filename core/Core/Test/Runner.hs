module Core.Test.Runner where

import Control.Concurrent.Async
import Core.Executor.Class qualified as C
import Core.Generator.Class (GenData (..), GenResult, Generator, generate)
import Core.Judge.Class (Judge, judge)
import Core.Judge.Class qualified as J
import Core.Judge.Exact qualified as ETypes
import Core.Judge.IgnoreOrder qualified as ITypes
import Core.Test.Converter (toGenInfo)
import Core.Test.Types qualified as Types
import Core.Types
import Data.Map qualified as M
import Data.Maybe (fromJust, fromMaybe)
import Data.Text qualified as T
import Text.Read (readMaybe)

data TestResult = Pass Int | WA (Maybe String) String | TLE | RE String deriving (Show, Eq)

data SolutionBatch = SolutionBatch {solution :: String, entryMain :: String, entryTime :: String, utilities :: String, sbLang :: Language}

runSuite ::
  (C.CodeExecutor e, Generator g) =>
  e ->
  g ->
  SolutionBatch ->
  Types.TestSuite ->
  IO [TestResult]
runSuite exec gen batch suite =
  mapConcurrently
    (\test -> handleTestCase exec gen batch seed suite test)
    (Types.tsCases suite)
  where
    seed = Types.tsSeed suite

handleTestCase ::
  (C.CodeExecutor e, Generator g) =>
  e -> g -> SolutionBatch -> Int -> Types.TestSuite -> Types.TestCase -> IO TestResult
handleTestCase exec gen batch seed suite test = do
  let lang = sbLang batch

  let judType = case Types.tcJudge test of
        Just v -> v
        Nothing -> Types.tsJudge suite

  let jud = convertTestJudgeToJudge (Types.jType judType)

  let (inCases, inGens) = foldr splitIn ([], []) (Types.tcIn test)
        where
          splitIn (var, Types.InCase c) (cs, gs) = ((var, c) : cs, gs)
          splitIn (var, Types.InGenerated gData) (cs, gs) = (cs, (var, gData) : gs)

  let generateField (var, gData) =
        let gInfo = toGenInfo gData
            genData = GenData seed gInfo lang
            result = generate gen genData
         in (var, result)

  let genResults = map generateField inGens

  let callStr = case Types.tcCall test of
        Just call -> fromJust (M.lookup lang call)
        Nothing -> fromJust (M.lookup lang (Types.teCall $ Types.tsEntry suite))

  let buildContent template =
        let entryWithCall = replaceUniversal "${CALL_SOLUTION}" callStr template
            afterGen = foldl (\acc (var, res) -> replaceUniversal ("{" ++ var ++ "}") res acc) entryWithCall genResults
            fullCall = foldl (\acc (var, val) -> replaceUniversal ("{" ++ var ++ "}") val acc) afterGen inCases
            withRuntime = replaceUniversal "${UTILITIES}" (utilities batch) fullCall
         in replaceUniversal "${SOLUTION}" (solution batch) withRuntime

  let timeReady = buildContent (entryTime batch)
  timeResponse <-
    C.execute
      exec
      ( C.ExecRequest
          { C.language = lang,
            C.content = timeReady,
            C.runTimeout = Just 15000, -- hardcoded 15s
            C.runMemoryLimit = Just (Types.tlMemoryMb (Types.tsLimits suite))
          }
      )

  case timeResponse of
    C.ExecFail err s -> return $ toExecStatus s err
    C.ExecSuc tOut -> do
      let tLast = last (lines tOut)
      let ms = fromMaybe 0 (readMaybe . T.unpack . T.strip . T.pack $ tLast)
      let mainReady = buildContent (entryMain batch)
      if ms > Types.tlTimeMs (Types.tsLimits suite)
        then
          return TLE
        else do
          response <-
            C.execute
              exec
              ( C.ExecRequest
                  { C.language = lang,
                    C.content = mainReady,
                    C.runTimeout = Just 15000, -- hardcoded 15s
                    C.runMemoryLimit = Nothing
                  }
              )
          case response of
            C.ExecFail err s -> return $ toExecStatus s err
            C.ExecSuc mOut -> do
              let mLast = last (lines mOut)
              case Types.tcOut test of
                Just (Types.OutCase expected) ->
                  let res = judge jud expected mLast
                   in return $ case res of
                        J.Pass -> Pass ms
                        J.Fail _ -> WA (Just expected) mLast
                Nothing -> case M.lookup Python3 (Types.tsOracle suite) of
                  Nothing -> fail "No expected output and no oracle for Python3"
                  Just oracleSolution -> do
                    let oracleTemplate =
                          "import datetime as _dt\n"
                            ++ "from dataclasses import is_dataclass, asdict\n"
                            ++ "from typing import Any, List, Dict\n"
                            ++ utilities batch
                            ++ "\n"
                            ++ Types.checker oracleSolution
                            ++ "\n"
                            ++ solution batch
                            ++ "\n"
                            ++ "print(to_json("
                            ++ Types.call oracleSolution
                            ++ "))"
                    let cleanResult = T.unpack . T.strip . T.pack $ mLast
                    let oracleReady =
                          let withResult = replaceUniversal "{result}" (show cleanResult) oracleTemplate
                              withCall = replaceUniversal "${CALL_SOLUTION}" callStr withResult
                              afterGen = foldl (\acc (var, res) -> replaceUniversal ("{" ++ var ++ "}") res acc) withCall genResults
                              fullCall = foldl (\acc (var, val) -> replaceUniversal ("{" ++ var ++ "}") val acc) afterGen inCases
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
                          else return (WA Nothing mLast)

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

toExecStatus :: C.ExecStatus -> String -> TestResult
toExecStatus C.TLE _ = TLE
toExecStatus C.RE err = RE err
toExecStatus (C.Unknown s) err = RE (s <> " " <> err)
