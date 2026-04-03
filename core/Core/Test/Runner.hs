module Core.Test.Runner where

import Control.Concurrent.Async
import Core.Executor.Class (CodeExecutor, ExecRequest (..), ExecResult (..), execute)
import Core.Generator.Class (GenData (..), GenResult, Generator, generate)
import Core.Judge.Class (Judge, judge)
import Core.Judge.Class qualified as J
import Core.Test.Converter (toGenInfo)
import Core.Test.Types qualified as Types
import Core.Types
import Data.Map qualified as M
import Data.Maybe (fromJust)
import Data.Text qualified as T

data TestResult = Pass | Fail String deriving (Show, Eq)

data SolutionBatch = SolutionBatch {solution :: String, entry :: String, runtime :: String}

renderGenResult :: GenResult -> String
renderGenResult r = r

replaceUniversal :: String -> String -> String -> String
replaceUniversal target replacement input =
  let tTarget = T.pack target
      tReplacement = T.pack replacement
      tInput = T.pack input
   in T.unpack $ T.replace tTarget tReplacement tInput

handleTestCase ::
  (CodeExecutor e, Generator g, Judge j) =>
  e -> g -> j -> Language -> SolutionBatch -> Int -> Types.TestSuite -> Types.TestCase -> IO TestResult
handleTestCase exec gen jud lang batch seed suite test = do
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

  let poorEntry = entry batch
  let entryWithCall = replaceUniversal "${CALL_SOLUTION}" (fromJust (M.lookup lang (Types.teCall $ Types.tsEntry suite))) poorEntry

  let afterGen = foldl (\acc (var, res) -> replaceUniversal ("{" ++ var ++ "}") res acc) entryWithCall genResults
  let fullCall = foldl (\acc (var, val) -> replaceUniversal ("{" ++ var ++ "}") val acc) afterGen inCases

  let withRuntime = replaceUniversal "${JSON_GEN}" (runtime batch) fullCall
  let ready = replaceUniversal "${SOLUTION}" (solution batch) withRuntime

  response <-
    execute
      exec
      ( ExecRequest
          { language = lang,
            content = ready,
            runTimeout = Types.tlTimeMs (Types.tsLimits suite),
            runMemoryLimit = Types.tlMemoryMb (Types.tsLimits suite)
          }
      )

  case response of
    ExecFail err -> return $ Fail err
    ExecSuc out ->
      case Types.tcOut test of
        Just (Types.OutCase expected) ->
          let res = judge jud expected out
           in return $ case res of
                J.Pass -> Pass
                J.Fail err -> Fail err
        Nothing -> case M.lookup Python3 (Types.tsOracle suite) of
          Nothing -> return $ Fail "no expected output and no oracle for Python3"
          Just oracleSolution -> do
            let oracleReady = replaceUniversal "${SOLUTION}" oracleSolution withRuntime
            oracleResponse <-
              execute
                exec
                ( ExecRequest
                    { language = Python3,
                      content = oracleReady,
                      runTimeout = Types.tlTimeMs (Types.tsLimits suite),
                      runMemoryLimit = Types.tlMemoryMb (Types.tsLimits suite)
                    }
                )
            case oracleResponse of
              ExecFail err -> return $ Fail $ "oracle execution error: " ++ err
              ExecSuc oracleOut ->
                let res = judge jud oracleOut out
                 in return $ case res of
                      J.Pass -> Pass
                      J.Fail err -> Fail err

runSuite ::
  (CodeExecutor e, Generator g, Judge j) =>
  e ->
  g ->
  j ->
  Language ->
  SolutionBatch ->
  Types.TestSuite ->
  IO [TestResult]
runSuite exec gen jud lang batch suite =
  mapConcurrently
    (\test -> handleTestCase exec gen jud lang batch seed suite test)
    (Types.tsCases suite)
  where
    seed = Types.tsSeed suite
