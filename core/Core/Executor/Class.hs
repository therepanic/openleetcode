module Core.Executor.Class where

import Core.Types

data ExecRequest = ExecRequest
  { language :: Language,
    content :: Text,
    runTimeout :: Int,
    runMemoryLimit :: Int
  }

data ExecResult
  = ExecSuccess {stdout :: Text}
  | ExecError {stderr :: Text}

class CodeExecutor e where
  execute :: e ExecRequest -> IO ExecResult
