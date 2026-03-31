module Core.Judge.Class where

data JudgeResult = Pass | Fail String deriving (Show, Eq)

class Judge j where
  judge :: j -> String -> String -> JudgeResult
