module Main where

import Generator.SplitmixSpec qualified as SplitmixSpec
import Judge.ExactSpec qualified as ExactSpec
import Judge.IgnoreOrderSpec qualified as IgnoreOrderSpec
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Generator/Splitmix" SplitmixSpec.spec
  describe "Judge/ExactSpec" ExactSpec.spec
  describe "Judge/IgnoreOrderSpec" IgnoreOrderSpec.spec
