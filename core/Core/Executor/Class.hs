module Core.Executor.Class where

import Core.Types

data ExecRequest = ExecRequest
  { language :: Language,
    content :: String,
    runTimeout :: Int,
    runMemoryLimit :: Int
  }
  deriving (Show)

data ExecResult = ExecSuc {stdout :: String} | ExecFail {stderr :: String}

type ExecResponse = ExecResult

class CodeExecutor e where
  execute :: e -> ExecRequest -> IO ExecResponse
