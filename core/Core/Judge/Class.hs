module Core.Judge.Class where

data JudgeResult = Pass | Fail String

class Judge j where
  judge :: j -> String -> String -> JudgeResult
