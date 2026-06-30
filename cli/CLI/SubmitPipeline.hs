module CLI.SubmitPipeline where

import CLI.AppEnv (Config)
import Core.Test.Runner (SolutionBatch, TestInput, TestResult)
import Core.Test.Types (TestSuite)
import Core.Types (Language)
import Data.Text (Text)

data SubmitResolved = SubmitResolved
  { srConfig :: Config,
    srLang :: Language,
    srBatch :: SolutionBatch,
    srTestSuite :: TestSuite
  }

data SubmitFailure
  = SubmitMissingSelector
  | SubmitSolutionReadError FilePath Text
  | SubmitUnknownExtension Text
  | SubmitSuiteNotFoundById Int
  | SubmitSuiteNotFoundByTitle Text
  | SubmitBackendUnavailable Text
  | SubmitInternalWhileJudging (Maybe Int) (Maybe TestInput) Text
  | SubmitJudgeInternal (Maybe Int) (Maybe TestInput) Text
  | SubmitInfraFailure Text
  | SubmitVerdict Int TestInput TestResult
  deriving (Eq, Show)
