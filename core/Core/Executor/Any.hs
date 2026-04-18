{-# LANGUAGE GADTs #-}

module Core.Executor.Any where

import Core.Executor.Class
import Core.Executor.Piston (PistonExecutor (PistonExecutor))
import Core.Types (ExecutorType (Piston))

data AnyExecutor where
  AnyExecutor :: (CodeExecutor e) => e -> AnyExecutor

instance CodeExecutor AnyExecutor where
  execute (AnyExecutor e) req = execute e req

convertExecutorTypeToExecutor :: ExecutorType -> String -> AnyExecutor
convertExecutorTypeToExecutor Piston url = AnyExecutor (PistonExecutor url)
