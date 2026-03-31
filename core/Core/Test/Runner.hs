{-# LANGUAGE OverloadedStrings #-}

module Core.Test.Runner where

import Core.Executor.Class (CodeExecutor, ExecRequest (..), ExecResult (..), execute)
import Core.Generator.Class (GenData (..), GenResult, Generator, generate)
import Core.Judge.Class (Judge, judge)
import Core.Judge.Class qualified as J
import Core.Test.Converter (toGenInfo)
import Core.Test.Types qualified as Types
import Core.Types
import Data.Map qualified as M
import Data.Text qualified as T

data TestResult = Pass | Fail String deriving (Show, Eq)

data SolutionBatch = SolutionBatch {solution :: String, entry :: String}

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
  e -> g -> j -> Language -> SolutionBatch -> String -> Int -> Types.TestLimits -> Types.TestOracle -> Types.TestCase -> IO TestResult
handleTestCase exec gen jud lang batch runtime seed limits oracle test = do
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

  let afterGen = foldl (\acc (var, res) -> replaceUniversal var res acc) (entry batch) genResults
  let fullCall = foldl (\acc (var, val) -> replaceUniversal var val acc) afterGen inCases

  let withRuntime = replaceUniversal "${JSON_GEN}" runtime fullCall
  let ready = replaceUniversal "${SOLUTION}" (solution batch) withRuntime

  response <-
    execute
      exec
      ( ExecRequest
          { language = lang,
            content = ready,
            runTimeout = Types.tlTimeMs limits,
            runMemoryLimit = Types.tlMemoryMb limits
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
        Nothing -> case M.lookup Python3 oracle of
          Nothing -> return $ Fail "no expected output and no oracle for Python3"
          Just oracleSolution -> do
            let oracleReady = replaceUniversal "${SOLUTION}" oracleSolution withRuntime
            oracleResponse <-
              execute
                exec
                ( ExecRequest
                    { language = Python3,
                      content = oracleReady,
                      runTimeout = Types.tlTimeMs limits,
                      runMemoryLimit = Types.tlMemoryMb limits
                    }
                )
            case oracleResponse of
              ExecFail err -> return $ Fail $ "oracle execution error: " ++ err
              ExecSuc oracleOut ->
                let res = judge jud oracleOut out
                 in return $ case res of
                      J.Pass -> Pass
                      J.Fail err -> Fail err

-- runSuite ::
--   (CodeExecutor e, Generator g, Judge j) =>
--   e ->
--   g ->
--   j ->
--   Language ->
--   SolutionBatch ->
--   TestSuite ->
--   IO [TestResult]
