module Generator.SplitmixSpec (spec) where

import Core.Generator.Class
import Core.Generator.Splitmix
import Core.Test.Types (GIDArrElemType (GIDArrElemInt))
import Core.Types
import Data.List (isPrefixOf, nub)
import Test.Hspec

spec :: Spec
spec = do
  describe "integral" $ do
    it "const returns exact value" $
      val (GenIntegralInfo (GenIntegralConst 42)) `shouldBe` "42"

    it "range stays within bounds" $ do
      let n = read $ val (GenIntegralInfo (GenIntegralRange 5 10))
      n `shouldSatisfy` (\x -> x >= 5 && x <= 10)

  describe "float" $ do
    it "const returns exact value" $
      val (GenFloatInfo (GenFloatConst 3.14)) `shouldBe` "3.14"

    it "range stays within bounds" $ do
      let n = read $ val (GenFloatInfo (GenFloatRange 0.0 1.0 2))
      n `shouldSatisfy` (\x -> x >= 0.0 && x <= 1.0)

  describe "boolean" $ do
    it "const returns exact value" $ do
      val (GenBoolInfo (GenBoolConst True)) `shouldBe` "True"
      val (GenBoolInfo (GenBoolConst False)) `shouldBe` "False"

    it "random produces a boolean string" $ do
      let v = val (GenBoolInfo GenBoolGen)
      v `shouldSatisfy` (\s -> s == "True" || s == "False")

  describe "boolean (cross-language)" $ do
    it "returns lowercase true for Java" $ do
      let d = GenData {seed = 42, info = GenBoolInfo (GenBoolConst True), lang = Java}
      generate SplitmixGenerator d `shouldBe` "true"

    it "array of bools for Java should be lowercase" $ do
      let info' = GenArrInfo (GenArr False (GenIntegralConst 2) (GenBoolInfo (GenBoolConst True)) Nothing)
      let d = GenData {seed = 42, info = info', lang = Java}
      generate SplitmixGenerator d `shouldBe` "true, true"

  describe "string" $ do
    it "generates string of correct length" $ do
      let v = val (GenStrInfo (GenStr (GenIntegralConst 10) "abc"))
      length v `shouldBe` 10

    it "uses only characters from alphabet" $ do
      let alphabet = "XYZ"
      let v = val (GenStrInfo (GenStr (GenIntegralConst 50) alphabet))
      v `shouldSatisfy` all (`elem` alphabet)

  describe "array" $ do
    it "boolean array has correct format" $ do
      let v = val (GenArrInfo (GenArr False (GenIntegralConst 3) (GenBoolInfo (GenBoolConst True)) Nothing))
      v `shouldBe` "True, True, True"

    it "distinct string array has no duplicates" $ do
      let genStr = GenStr (GenIntegralConst 1) "abcde"
      let v = val (GenArrInfo (GenArr True (GenIntegralConst 5) (GenStrInfo genStr) Nothing))
      let strs = map (filter (/= ' ')) (splitOn ',' v)
      length strs `shouldBe` length (nub strs)

    it "distinct boolean array capped at 2" $ do
      let v = val (GenArrInfo (GenArr True (GenIntegralConst 10) (GenBoolInfo GenBoolGen) Nothing))
      let parts = splitOn ',' v
      length parts `shouldSatisfy` (\l -> l <= 2)

    it "non-distinct array has correct length" $ do
      let v = val (GenArrInfo (GenArr False (GenIntegralConst 5) (GenIntegralInfo (GenIntegralRange 0 100)) Nothing))
      length (filter (== ',') v) `shouldBe` 4

    it "distinct array has no duplicates" $ do
      let v = val (GenArrInfo (GenArr True (GenIntegralConst 10) (GenIntegralInfo (GenIntegralRange 1 100)) Nothing))
      let nums = parseNums v
      length nums `shouldBe` length (nub nums)

  describe "determinism" $ do
    it "same seed produces same result" $ do
      let d = mkData 99 (GenIntegralInfo (GenIntegralRange 0 1000))
      generate SplitmixGenerator d `shouldBe` generate SplitmixGenerator d

    it "different seeds produce different results" $ do
      let r1 = val' 1 (GenIntegralInfo (GenIntegralRange 0 100000))
      let r2 = val' 2 (GenIntegralInfo (GenIntegralRange 0 100000))
      r1 `shouldNotBe` r2

  describe "array (2D)" $ do
    it "generates 2D int array for Python3" $ do
      let inner = GenArr False (GenIntegralConst 2) (GenIntegralInfo (GenIntegralRange 0 9)) Nothing
      let outer = GenArr False (GenIntegralConst 3) (GenArrInfo inner) Nothing
      let d = GenData {seed = 42, info = GenArrInfo outer, lang = Python3}
      let v = generate SplitmixGenerator d
      v `shouldSatisfy` (\s -> head s == '[' && last s == ']')

    it "generates 2D int array for Java" $ do
      let inner = GenArr False (GenIntegralConst 2) (GenIntegralInfo (GenIntegralRange 0 9)) (Just GIDArrElemInt)
      let outer = GenArr False (GenIntegralConst 3) (GenArrInfo inner) (Just GIDArrElemInt)
      let d = GenData {seed = 42, info = GenArrInfo outer, lang = Java}
      let v = generate SplitmixGenerator d
      v `shouldSatisfy` (\s -> "new int[]{" `isPrefixOf` s || "new int[]{ " `isPrefixOf` s)

    it "generates 2D int array for Kotlin" $ do
      let inner = GenArr False (GenIntegralConst 2) (GenIntegralInfo (GenIntegralRange 0 9)) (Just GIDArrElemInt)
      let outer = GenArr False (GenIntegralConst 2) (GenArrInfo inner) (Just GIDArrElemInt)
      let d = GenData {seed = 42, info = GenArrInfo outer, lang = Kotlin}
      let v = generate SplitmixGenerator d
      v `shouldSatisfy` ("intArrayOf(" `isPrefixOf`)

    it "generates 2D string array for Python3" $ do
      let inner = GenArr False (GenIntegralConst 2) (GenStrInfo (GenStr (GenIntegralConst 3) "abc")) Nothing
      let outer = GenArr False (GenIntegralConst 2) (GenArrInfo inner) Nothing
      let d = GenData {seed = 42, info = GenArrInfo outer, lang = Python3}
      let v = generate SplitmixGenerator d
      v `shouldSatisfy` (\s -> head s == '[' && last s == ']')

    it "const string in array" $ do
      let inner = GenArr False (GenIntegralConst 2) (GenStrInfo (GenStrConst "foo")) Nothing
      let d = GenData {seed = 42, info = GenArrInfo inner, lang = Python3}
      generate SplitmixGenerator d `shouldBe` "foo, foo"

mkData :: Int -> GenInfo -> GenData
mkData s i = GenData {seed = s, info = i, lang = Python3}

val :: GenInfo -> String
val i = val' 42 i

val' :: Int -> GenInfo -> String
val' s i = generate SplitmixGenerator (mkData s i)

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
