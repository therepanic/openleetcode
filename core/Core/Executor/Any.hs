{-# LANGUAGE GADTs #-}

module Core.Executor.Any where

import Core.Executor.Class
import Core.Executor.Piston (PistonExecutor (PistonExecutor))
import Core.Types (ExecutorType (Piston))
import Data.Text (Text)

data AnyExecutor where
  AnyExecutor :: (CodeExecutor e) => e -> AnyExecutor

instance CodeExecutor AnyExecutor where
  execute (AnyExecutor e) = execute e

convertExecutorTypeToExecutor :: ExecutorType -> Text -> AnyExecutor
convertExecutorTypeToExecutor Piston url = AnyExecutor (PistonExecutor url)
