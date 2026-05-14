module Main where

import CLISpec qualified
import Test.Hspec

main :: IO ()
main = hspec CLISpec.spec
