{-# LANGUAGE GADTs #-}

module Core.Executor.Class where

import Core.Types (Language)
import Data.Text (Text)

data ExecFile = ExecFile
  { fileName :: Text,
    fileContent :: Text
  }
  deriving (Show)

data ExecRequest = ExecRequest
  { language :: Language,
    content :: Text,
    files :: [ExecFile],
    runTimeout :: Maybe Int,
    runMemoryLimit :: Maybe Int
  }
  deriving (Show)

data ExecStatus = TLE | RE | Unknown Text deriving (Show)

data ExecResponse = ExecSuc {stdout :: Text} | ExecFail {stderr :: Text, status :: ExecStatus}

class CodeExecutor e where
  execute :: e -> ExecRequest -> IO ExecResponse
