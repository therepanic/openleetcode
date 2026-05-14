module CLI.SubmitPipeline where

import CLI.AppEnv (Config)
import Core.Test.Runner (SolutionBatch, TestResult)
import Core.Test.Types (TestSuite)
import Core.Types (Language)

data SubmitResolved = SubmitResolved
  { srConfig :: Config,
    srLang :: Language,
    srBatch :: SolutionBatch,
    srTestSuite :: TestSuite,
    srBackendLabel :: String,
    srBackendUrl :: String
  }

data SubmitFailure
  = SubmitMissingSelector
  | SubmitSolutionReadError FilePath String
  | SubmitUnknownExtension String
  | SubmitSuiteNotFoundById Int
  | SubmitSuiteNotFoundByTitle String
  | SubmitBackendUnavailable String
  | SubmitInternalWhileJudging (Maybe Int) String
  | SubmitJudgeInternal (Maybe Int) String
  | SubmitInfraFailure String
  | SubmitVerdict Int TestResult
  deriving (Eq, Show)
