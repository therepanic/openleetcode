module Main where

import Generator.SplitmixSpec qualified as SplitmixSpec
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Splitmix" SplitmixSpec.spec
