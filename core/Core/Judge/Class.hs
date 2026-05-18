module Core.Judge.Class where

import Data.Text (Text)

data JudgeResult = Pass | Fail Text deriving (Show, Eq)

class Judge j where
  judge :: j -> Text -> Text -> JudgeResult
