module Core.Judge.Exact where

import Core.Judge.Class

data Exact = Exact

instance Judge Exact where
  judge _ expected actual =
    if expected == actual
      then
        Pass
      else
        Fail ("expected: " ++ expected ++ " got: " ++ actual)
