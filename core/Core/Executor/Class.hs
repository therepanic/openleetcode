module Core.Executor.Class where

import Core.Types

data ExecRequest = ExecRequest
  { language :: Language,
    content :: String,
    runTimeout :: Maybe Int,
    runMemoryLimit :: Maybe Int
  }
  deriving (Show)

data ExecStatus = TLE | RE | Unknown String deriving (Show)

data ExecResponse = ExecSuc {stdout :: String} | ExecFail {stderr :: String, status :: ExecStatus}

class CodeExecutor e where
  execute :: e -> ExecRequest -> IO ExecResponse
