{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}

module Core.Executor.Class where

import Core.Types (Language)
import Data.Text (Text)

data ExecRequest = ExecRequest
  { language :: Language,
    content :: Text,
    runTimeout :: Maybe Int,
    runMemoryLimit :: Maybe Int
  }
  deriving (Show)

data ExecStatus = TLE | RE | Unknown Text deriving (Show)

data ExecResponse = ExecSuc {stdout :: Text} | ExecFail {stderr :: Text, status :: ExecStatus}

class CodeExecutor e where
  execute :: e -> ExecRequest -> IO ExecResponse
