module Judge.ExactSpec (spec) where

import Core.Judge.Class
import Core.Judge.Exact
import Test.Hspec

spec :: Spec
spec = do
  describe "Exact Judge" $ do
    it "passes when strings are identical" $ do
      judge Exact "123" "123" `shouldBe` Pass

    it "passes for identical boolean strings" $ do
      judge Exact "true" "true" `shouldBe` Pass

    it "fails when there is a case difference" $ do
      case judge Exact "True" "true" of
        Fail _ -> True `shouldBe` True
        _ -> expectationFailure "should have failed due to case mismatch"

    it "fails when there are extra spaces" $ do
      case judge Exact "1, 2" "1,2" of
        Fail msg -> msg `shouldContain` "Expected: 1, 2 Got: 1,2"
        _ -> expectationFailure "should have failed due to space mismatch"
