module Core.Generator.Splitmix where

import Core.Generator.Class
import Core.Types
import Data.Char (toLower)
import Data.List (foldl', intercalate)
import Data.Set qualified as S
import Data.Vector qualified as V
import Data.Word (Word64)
import System.Random.SplitMix

data SplitmixGenerator = SplitmixGenerator

instance Generator SplitmixGenerator where
  generate _ d =
    let gen = mkSMGen (fromIntegral (seed d))
        (result, _) = generateInfo (info d) (lang d) gen
     in result

generateInfo :: GenInfo -> Language -> SMGen -> (String, SMGen)
generateInfo (GenIntegralInfo i) _ gen = generateIntegral i gen
generateInfo (GenFloatInfo i) _ gen = generateFloat i gen
generateInfo (GenCharInfo i) _ gen = generateChar i gen
generateInfo (GenStrInfo i) _ gen = generateStr i gen
generateInfo (GenArrInfo i) l gen = generateArr i l gen
generateInfo (GenBoolInfo i) l gen = generateBool i l gen

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

generateChar :: GenChar -> SMGen -> (String, SMGen)
generateChar (GenCharConst c) gen = ([c], gen)
generateChar (GenCharVariety v) gen =
  let (c, gen') = generateCharFromList v gen
   in ([c], gen')
generateChar _ _ = error "Unhandled GenChar type"

generateStr :: GenStr -> SMGen -> (String, SMGen)
generateStr (GenStr l a) gen =
  let (v, gen') = generateIntegral l gen
      len = read v :: Int
      (charList, gen'') =
        foldl'
          ( \(acc, g) _ ->
              let (c, g') = generateCharFromList a g
               in (c : acc, g')
          )
          ("", gen')
          [0 .. len - 1]
   in (reverse charList, gen'')
generateStr _ _ = error "Unhandled GenStr type"

generateBool :: GenBool -> Language -> SMGen -> (String, SMGen)
generateBool (GenBoolConst b) lang gen = (if lang /= Python3 then map toLower $ show b else show b, gen)
generateBool GenBoolGen lang gen =
  let (w, gen') = nextWord64 gen
      val = even w
   in (if lang /= Python3 then map toLower $ show val else show val, gen')

generateArr :: GenArr -> Language -> SMGen -> (String, SMGen)
generateArr (GenArr False l (GenIntegralInfo (GenIntegralRange lo hi))) _ gen =
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
generateArr (GenArr True l (GenIntegralInfo (GenIntegralRange lo hi))) _ gen =
  let (v, gen') = generateIntegral l gen
      len = min (read v :: Int) (fromIntegral (hi - lo + 1))
      vec = V.fromList [lo .. hi]
      (shuffled, gen'') = fisherYates vec gen'
      nums = V.toList (V.take len shuffled)
      result = intercalate ", " (map show nums)
   in (result, gen'')
generateArr (GenArr False l (GenIntegralInfo (GenIntegralConst constVal))) _ gen =
  let (v, gen') = generateIntegral l gen
      len = read v :: Int
      result = replicate len constVal
      formattedString = intercalate ", " (map show result)
   in (formattedString, gen')
generateArr (GenArr True _ (GenIntegralInfo (GenIntegralConst constVal))) _ gen =
  (show constVal, gen)
generateArr (GenArr True l (GenFloatInfo (GenFloatRange lo hi p))) _ gen =
  let step = 1 / (10 ^ p)
      vec = V.fromList [lo, lo + step .. hi]
      (v, gen') = generateIntegral l gen
      len = min (read v :: Int) (V.length vec)
      (shuffled, gen'') = fisherYates vec gen'
      nums = V.toList (V.take len shuffled)
      result = intercalate ", " (map show nums)
   in (result, gen'')
generateArr (GenArr False l (GenFloatInfo (GenFloatRange lo hi p))) _ gen =
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
generateArr (GenArr False l (GenFloatInfo (GenFloatConst constVal))) _ gen =
  let (v, gen') = generateIntegral l gen
      len = read v :: Int
      result = replicate len constVal
      formattedString = intercalate ", " (map show result)
   in (formattedString, gen')
generateArr (GenArr True _ (GenFloatInfo (GenFloatConst constVal))) _ gen =
  (show constVal, gen)
generateArr (GenArr False l (GenCharInfo i)) _ gen =
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
      result = intercalate ", " (map (: []) (reverse chars))
   in (result, gen'')
generateArr (GenArr True l (GenCharInfo (GenCharVariety alphabet))) _ gen =
  let vec = V.fromList alphabet
      (v, gen') = generateIntegral l gen
      len = min (read v :: Int) (V.length vec)
      (shuffled, gen'') = fisherYates vec gen'
      chars = V.toList (V.take len shuffled)
      result = intercalate ", " (map (: []) chars)
   in (result, gen'')
generateArr (GenArr True _ (GenCharInfo (GenCharConst c))) _ gen =
  ([c], gen)
generateArr (GenArr False l (GenStrInfo val)) _ gen =
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
      result = intercalate ", " (reverse strs)
   in (result, gen'')
generateArr (GenArr True l (GenStrInfo val)) _ gen =
  let (v, gen') = generateIntegral l gen
      len = read v :: Int
      (strs, gen'') = go S.empty [] len gen'
   in (intercalate ", " (reverse strs), gen'')
  where
    go _ acc 0 g = (acc, g)
    go seen acc n g =
      let (s, g') = generateStr val g
       in if S.member s seen
            then go seen acc n g'
            else go (S.insert s seen) (s : acc) (n - 1) g'
generateArr (GenArr _ _ (GenArrInfo (GenArr {}))) _ _ = error "todo: think of something about two-dimensional arrays" -- todo
generateArr (GenArr False l (GenBoolInfo i)) lang gen =
  let (v, gen') = generateIntegral l gen
      len = read v :: Int
      (bools, gen'') =
        foldl'
          ( \(acc, g) _ ->
              let (s, g') = generateBool i lang g
               in (s : acc, g')
          )
          ([], gen')
          [1 .. len]
      result = intercalate ", " (reverse bools)
   in (if lang /= Python3 then map toLower result else result, gen'')
generateArr (GenArr True l (GenBoolInfo i)) lang gen =
  let (v, gen') = generateIntegral l gen
      len = min (read v :: Int) 2
      pool = case i of
        GenBoolConst b -> [b]
        GenBoolGen -> [True, False]
      vec = V.fromList pool
      (shuffled, gen'') = fisherYates vec gen'
      actualLen = min len (V.length shuffled)
      result = intercalate ", " (map show (V.toList (V.take actualLen shuffled)))
   in (if lang /= Python3 then map toLower result else result, gen'')

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

generateCharFromList :: [Char] -> SMGen -> (Char, SMGen)
generateCharFromList xs gen =
  let (it, gen') = generateIntegralInRange 0 (fromIntegral (length xs - 1) :: Integer) gen
   in (xs !! (fromIntegral it :: Int), gen')

fisherYates :: V.Vector a -> SMGen -> (V.Vector a, SMGen)
fisherYates vec gen = foldl' step (vec, gen) [0 .. V.length vec - 2]
  where
    step (v, g) i =
      let (j, g') = generateIntegralInRange (fromIntegral i) (fromIntegral (V.length v - 1)) g
          j' = fromIntegral j
          v' = v V.// [(i, v V.! j'), (j', v V.! i)]
       in (v', g')
