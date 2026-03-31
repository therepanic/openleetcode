module Generator.SplitmixSpec (spec) where

import Core.Generator.Class
import Core.Generator.Splitmix
import Core.Types
import Data.List (nub)
import Data.Map qualified as M
import Test.Hspec

spec :: Spec
spec = do
  describe "integral" $ do
    it "const returns exact value" $
      val "x" (GenIntegralInfo (GenIntegralConst 42)) `shouldBe` "42"

    it "range stays within bounds" $ do
      let n = read $ val "x" (GenIntegralInfo (GenIntegralRange 5 10))
      n `shouldSatisfy` (\x -> x >= 5 && x <= 10)

  describe "float" $ do
    it "const returns exact value" $
      val "f" (GenFloatInfo (GenFloatConst 3.14)) `shouldBe` "3.14"

    it "range stays within bounds" $ do
      let n = read $ val "f" (GenFloatInfo (GenFloatRange 0.0 1.0 2))
      n `shouldSatisfy` (\x -> x >= 0.0 && x <= 1.0)

  describe "boolean" $ do
    it "const returns exact value" $ do
      val "b" (GenBoolInfo (GenBoolConst True)) `shouldBe` "True"
      val "b" (GenBoolInfo (GenBoolConst False)) `shouldBe` "False"

    it "random produces a boolean string" $ do
      let v = val "b" (GenBoolInfo GenBoolGen)
      v `shouldSatisfy` (\s -> s == "True" || s == "False")

  describe "string" $ do
    it "generates string of correct length" $ do
      let v = val "s" (GenStrInfo (GenStr (GenIntegralConst 10) "abc"))
      length v `shouldBe` 12

    it "uses only characters from alphabet" $ do
      let alphabet = "XYZ"
      let v = val "s" (GenStrInfo (GenStr (GenIntegralConst 50) alphabet))
      let content = init (tail v)
      content `shouldSatisfy` all (`elem` alphabet)

  describe "array" $ do
    it "boolean array has correct format" $ do
      let v = val "a" (GenArrInfo (GenArr False (GenIntegralConst 3) (GenBoolInfo (GenBoolConst True))))
      v `shouldBe` "True, True, True"

    it "distinct string array has no duplicates" $ do
      let genStr = GenStr (GenIntegralConst 1) "abcde"
      let v = val "a" (GenArrInfo (GenArr True (GenIntegralConst 5) (GenStrInfo genStr)))
      let strs = map (filter (/= ' ')) (splitOn ',' v)
      length strs `shouldBe` length (nub strs)

    it "distinct boolean array capped at 2" $ do
      let v = val "a" (GenArrInfo (GenArr True (GenIntegralConst 10) (GenBoolInfo GenBoolGen)))
      let parts = splitOn ',' v
      length parts `shouldSatisfy` (\l -> l <= 2)

    it "non-distinct array has correct length" $ do
      let v = val "a" (GenArrInfo (GenArr False (GenIntegralConst 5) (GenIntegralInfo (GenIntegralRange 0 100))))
      length (filter (== ',') v) `shouldBe` 4

    it "distinct array has no duplicates" $ do
      let v = val "a" (GenArrInfo (GenArr True (GenIntegralConst 10) (GenIntegralInfo (GenIntegralRange 1 100))))
      let nums = parseNums v
      length nums `shouldBe` length (nub nums)

    it "distinct array length capped by range size" $ do
      let v = val "a" (GenArrInfo (GenArr True (GenIntegralConst 100) (GenIntegralInfo (GenIntegralRange 1 5))))
      length (parseNums v) `shouldBe` 5

  describe "determinism" $ do
    it "same seed produces same result" $ do
      let d = mkData 99 "x" (GenIntegralInfo (GenIntegralRange 0 1000))
      result (generate SplitmixGenerator d) `shouldBe` result (generate SplitmixGenerator d)

    it "different seeds produce different results" $ do
      let r1 = val' 1 "x" (GenIntegralInfo (GenIntegralRange 0 100000))
      let r2 = val' 2 "x" (GenIntegralInfo (GenIntegralRange 0 100000))
      r1 `shouldNotBe` r2

mkData :: Int -> String -> GenInfo -> GenData
mkData s k i = GenData {seed = s, info = [(k, i)], lang = Python3}

val :: String -> GenInfo -> String
val k i = val' 42 k i

val' :: Int -> String -> GenInfo -> String
val' s k i =
  let GenResult r = generate SplitmixGenerator (mkData s k i)
   in r M.! k

parseNums :: String -> [Integer]
parseNums s = map (read . filter (/= ' ')) (splitOn ',' s)

splitOn :: Char -> String -> [String]
splitOn _ "" = [""]
splitOn delim str = foldr f [""] str
  where
    f c (x : xs)
      | c == delim = "" : x : xs
      | otherwise = (c : x) : xs
    f _ [] = []
