module Core.Generator.Splitmix where

import Core.Generator.Class
import Data.List (foldl', intercalate)
import Data.Map qualified as M
import Data.Set qualified as S
import Data.Vector qualified as V
import Data.Word (Word64)
import System.Random.SplitMix

fisherYates :: V.Vector a -> SMGen -> (V.Vector a, SMGen)
fisherYates vec gen = foldl' step (vec, gen) [0 .. V.length vec - 2]
  where
    step (v, g) i =
      let (j, g') = generateIntegralInRange (fromIntegral i) (fromIntegral (V.length v - 1)) g
          j' = fromIntegral j
          v' = v V.// [(i, v V.! j'), (j', v V.! i)]
       in (v', g')

generateIntegralInRange :: Integer -> Integer -> SMGen -> (Integer, SMGen)
generateIntegralInRange lo hi gen =
  let (w, gen') = nextWord64 gen
      range = fromIntegral (hi - lo + 1) :: Word64
      val = lo + fromIntegral (mod w range)
   in (val, gen')

generateFloatInRange :: Double -> Double -> Int -> SMGen -> (Double, SMGen)
generateFloatInRange lo hi prec gen =
  let factor = 10 ^ prec
      loI = round (lo * fromIntegral factor) :: Integer
      hiI = round (hi * fromIntegral factor) :: Integer
      (n, gen') = generateIntegralInRange loI hiI gen
      val = fromIntegral n / fromIntegral factor :: Double
   in (val, gen')

generateIntegral :: GenIntegral -> SMGen -> (String, SMGen)
generateIntegral (GenIntegralConst c) gen = (show c, gen)
generateIntegral (GenIntegralRange lo hi) gen =
  let (val, gen') = generateIntegralInRange lo hi gen
   in (show val, gen')
generateIntegral _ _ = error "Unhandled GenInt type"

generateFloat :: GenFloat -> SMGen -> (String, SMGen)
generateFloat (GenFloatConst c) gen = (show c, gen)
generateFloat (GenFloatRange lo hi prec) gen =
  let (val, gen') = generateFloatInRange lo hi prec gen
   in (show val, gen')
generateFloat _ _ = error "Unhandled GenFloat type"

generateCharFromList :: [Char] -> SMGen -> (Char, SMGen)
generateCharFromList xs gen =
  let (it, gen') = generateIntegralInRange 0 (fromIntegral (length xs - 1) :: Integer) gen
   in (xs !! (fromIntegral it :: Int), gen')

generateChar :: GenChar -> SMGen -> (String, SMGen)
generateChar (GenCharConst c) gen = (show c, gen)
generateChar (GenCharVariety v) gen =
  let (c, gen') = generateCharFromList v gen
   in (show c, gen')
generateChar _ _ = error "Unhandled GenChar type"

generateStr :: GenStr -> SMGen -> (String, SMGen)
generateStr (GenStr l a) gen =
  let (v, gen') = generateIntegral l gen
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

generateArr :: GenArr -> SMGen -> (String, SMGen)
generateArr (GenArr False l (GenIntegralInfo (GenIntegralRange lo hi))) gen =
  let (v, gen') = generateIntegral l gen
      len = read v :: Int
      (nums, gen'') =
        foldl'
          ( \(acc, g) _ ->
              let (c, g') = generateIntegralInRange lo hi g
               in (c : acc, g')
          )
          ([], gen')
          [1 .. len]
      result = intercalate ", " (map show (reverse nums))
   in (result, gen'')
generateArr (GenArr True l (GenIntegralInfo (GenIntegralRange lo hi))) gen =
  let (v, gen') = generateIntegral l gen
      len = min (read v :: Int) (fromIntegral (hi - lo + 1))
      vec = V.fromList [lo .. hi]
      (shuffled, gen'') = fisherYates vec gen'
      nums = V.toList (V.take len shuffled)
      result = intercalate ", " (map show nums)
   in (result, gen'')
generateArr (GenArr False l (GenIntegralInfo (GenIntegralConst constVal))) gen =
  let (v, gen') = generateIntegral l gen
      len = read v :: Int
      result = replicate len constVal
      formattedString = intercalate ", " (map show result)
   in (formattedString, gen')
generateArr (GenArr True _ (GenIntegralInfo (GenIntegralConst constVal))) gen =
  (show constVal, gen)
generateArr (GenArr True l (GenFloatInfo (GenFloatRange lo hi p))) gen =
  let step = 1 / (10 ^ p)
      vec = V.fromList [lo, lo + step .. hi]
      (v, gen') = generateIntegral l gen
      len = min (read v :: Int) (V.length vec)
      (shuffled, gen'') = fisherYates vec gen'
      nums = V.toList (V.take len shuffled)
      result = intercalate ", " (map show nums)
   in (result, gen'')
generateArr (GenArr False l (GenFloatInfo (GenFloatRange lo hi p))) gen =
  let (v, gen') = generateIntegral l gen
      len = read v :: Int
      (nums, gen'') =
        foldl'
          ( \(acc, g) _ ->
              let (c, g') = generateFloatInRange lo hi p g
               in (c : acc, g')
          )
          ([], gen')
          [1 .. len]
      result = intercalate ", " (map show (reverse nums))
   in (result, gen'')
generateArr (GenArr False l (GenFloatInfo (GenFloatConst constVal))) gen =
  let (v, gen') = generateIntegral l gen
      len = read v :: Int
      result = replicate len constVal
      formattedString = intercalate ", " (map show result)
   in (formattedString, gen')
generateArr (GenArr True _ (GenFloatInfo (GenFloatConst constVal))) gen =
  (show constVal, gen)
generateArr (GenArr False l (GenCharInfo i)) gen =
  let (v, gen') = generateIntegral l gen
      len = read v :: Int
      (chars, gen'') =
        foldl'
          ( \(acc, g) _ ->
              let (s, g') = generateChar i g
               in (head s : acc, g')
          )
          ([], gen')
          [1 .. len]
      result = intercalate ", " (map show (reverse chars))
   in (result, gen'')
generateArr (GenArr True l (GenCharInfo (GenCharVariety alphabet))) gen =
  let vec = V.fromList alphabet
      (v, gen') = generateIntegral l gen
      len = min (read v :: Int) (V.length vec)
      (shuffled, gen'') = fisherYates vec gen'
      chars = V.toList (V.take len shuffled)
      result = intercalate ", " (map show chars)
   in (result, gen'')
generateArr (GenArr True _ (GenCharInfo (GenCharConst c))) gen =
  (show c, gen)
generateArr (GenArr False l (GenStrInfo val)) gen =
  let (v, gen') = generateIntegral l gen
      len = read v :: Int
      (strs, gen'') =
        foldl'
          ( \(acc, g) _ ->
              let (s, g') = generateStr val g
               in (s : acc, g')
          )
          ([], gen')
          [1 .. len]
      result = intercalate ", " (map show (reverse strs))
   in (result, gen'')
generateArr (GenArr True l (GenStrInfo val)) gen =
  let (v, gen') = generateIntegral l gen
      len = read v :: Int
      (strs, gen'') = go S.empty [] len gen'
   in (intercalate ", " (map show (reverse strs)), gen'')
  where
    go _ acc 0 g = (acc, g)
    go seen acc n g =
      let (s, g') = generateStr val g
       in if S.member s seen
            then go seen acc n g'
            else go (S.insert s seen) (s : acc) (n - 1) g'
generateArr (GenArr _ _ (GenArrInfo (GenArr {}))) _ = error "todo: think of something about two-dimensional arrays" -- todo

data SplitmixGenerator = SplitmixGenerator

instance Generator SplitmixGenerator where
  generate _ d =
    let go :: [(String, GenInfo)] -> M.Map String String -> SMGen -> M.Map String String
        go [] m _ = m
        go ((k, GenIntegralInfo i) : xs) m gen =
          let (v, gen') = generateIntegral i gen
           in go xs (M.insert k v m) gen'
        go ((k, GenFloatInfo i) : xs) m gen =
          let (v, gen') = generateFloat i gen
           in go xs (M.insert k v m) gen'
        go ((k, GenCharInfo i) : xs) m gen =
          let (v, gen') = generateChar i gen
           in go xs (M.insert k v m) gen'
        go ((k, GenStrInfo i) : xs) m gen =
          let (v, gen') = generateStr i gen
           in go xs (M.insert k v m) gen'
        go ((k, GenArrInfo i) : xs) m gen =
          let (v, gen') = generateArr i gen
           in go xs (M.insert k v m) gen'
     in GenResult {result = go (info d) M.empty (mkSMGen (fromIntegral (seed d)))}
