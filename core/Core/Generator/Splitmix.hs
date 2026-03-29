module Core.Generator.Splitmix where

import Core.Generator.Class
import Data.List (foldl')
import Data.Word (Word64)
import System.Random.SplitMix

generateIntInRange :: Int -> Int -> SMGen -> (Int, SMGen)
generateIntInRange lo hi gen =
  let (w, gen') = nextWord64 gen
      range = fromIntegral (hi - lo + 1) :: Word64
      val = lo + fromIntegral (mod w range)
   in (val, gen')

generateFloatInRange :: Double -> Double -> Int -> SMGen -> (Double, SMGen)
generateFloatInRange lo hi prec gen =
  let factor = 10 ^ prec
      loI = round (lo * fromIntegral factor) :: Int
      hiI = round (hi * fromIntegral factor) :: Int
      (n, gen') = generateIntInRange loI hiI gen
      val = fromIntegral n / fromIntegral factor :: Double
   in (val, gen')

generateInt :: GenInt -> SMGen -> (String, SMGen)
generateInt (GenIntConst c) gen = (show c, gen)
generateInt (GenIntRange lo hi) gen =
  let (val, gen') = generateIntInRange lo hi gen
   in (show val, gen')
generateInt _ _ = error "Unhandled GenInt type"

generateFloat :: GenFloat -> SMGen -> (String, SMGen)
generateFloat (GenFloatConst c) gen = (show c, gen)
generateFloat (GenFloatRange lo hi prec) gen =
  let (val, gen') = generateFloatInRange lo hi prec gen
   in (show val, gen')
generateFloat _ _ = error "Unhandled GenFloat type"

generateCharFromList :: [Char] -> SMGen -> (Char, SMGen)
generateCharFromList xs gen =
  let (it, gen') = generateIntInRange 0 (length xs - 1) gen
   in (xs !! it, gen')

generateChar :: GenChar -> SMGen -> (String, SMGen)
generateChar (GenCharConst c) gen = (show c, gen)
generateChar (GenCharVariety v) gen =
    let
        (c, gen') = generateCharFromList v gen
    in
        (show c, gen')
generateChar _ _ = error "Unhandled GenChar type"

generateStr :: GenStr -> SMGen -> (String, SMGen)
generateStr (GenStr l a) gen =
  let (v, gen') = generateInt l gen
      len = read v :: Int
      (result, gen'') =
        foldl'
          ( \(acc, g) _ ->
              let (c, g') = generateCharFromList a g
               in (acc ++ show c, g')
          )
          ("", gen')
          [0 .. len - 1]
   in (result, gen'')
generateStr _ _ = error "Unhandled GenStr type"
