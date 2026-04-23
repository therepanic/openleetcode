module Judge.IgnoreOrderSpec (spec) where

import Core.Judge.Class
import Core.Judge.IgnoreOrder
import Test.Hspec

spec :: Spec
spec = do
  describe "IgnoreOrder Judge" $ do
    it "passes when json arrays have same elements in different order" $ do
      judge IgnoreOrder "[1, 2, 3]" "[3, 1, 2]" `shouldBe` Pass

    it "passes for nested arrays with different order" $ do
      judge IgnoreOrder "[[1, 2], [3, 4]]" "[[3, 4], [2, 1]]" `shouldBe` Pass

    it "passes for identical strings" $ do
      judge IgnoreOrder "[\"a\", \"b\"]" "[\"b\", \"a\"]" `shouldBe` Pass

    it "fails when elements are different" $ do
      case judge IgnoreOrder "[1, 2, 3]" "[1, 2, 4]" of
        Fail _ -> True `shouldBe` True
        _ -> expectationFailure "should fail because 4 is not 3"

    it "fails when lengths are different" $ do
      case judge IgnoreOrder "[1, 2]" "[1, 2, 3]" of
        Fail _ -> True `shouldBe` True
        _ -> expectationFailure "should fail because lengths differ"

    it "fails with error message on invalid json" $ do
      case judge IgnoreOrder "not a json" "[1, 2]" of
        Fail msg -> msg `shouldBe` "Failed to parse json"
        _ -> expectationFailure "should fail on invalid input"
