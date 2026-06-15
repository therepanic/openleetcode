{-# LANGUAGE OverloadedStrings #-}

module Core.Generator.Splitmix where

import Core.Generator.Class
import Core.Test.Runner (renderNestedArr)
import Core.Types
import Data.List (foldl', sort)
import Data.Set qualified as S
import Data.Text (Text)
import Data.Text qualified as T
import Data.Vector qualified as V
import Data.Word (Word64)
import System.Random.SplitMix

data SplitmixGenerator = SplitmixGenerator

instance Generator SplitmixGenerator where
  generate _ d =
    let gen = mkSMGen (fromIntegral (seed d))
        (result, _) = generateInfo (info d) (lang d) gen
     in result

generateInfo :: GenInfo -> Language -> SMGen -> (Text, SMGen)
generateInfo (GenIntegralInfo i) _ gen = generateIntegral i gen
generateInfo (GenFloatInfo i) _ gen = generateFloat i gen
generateInfo (GenCharInfo i) _ gen = generateChar i gen
generateInfo (GenStrInfo i) _ gen = generateStr i gen
generateInfo (GenArrInfo i) l gen = generateArr i l gen
generateInfo (GenBoolInfo i) l gen = generateBool i l gen

generateIntegral :: GenIntegral -> SMGen -> (Text, SMGen)
generateIntegral (GenIntegralConst c) gen = (T.pack (show c), gen)
generateIntegral (GenIntegralRange lo hi) gen =
  let (val, gen') = generateIntegralInRange lo hi gen
   in (T.pack (show val), gen')
generateIntegral _ _ = error "Unhandled GenInt type"

generateFloat :: GenFloat -> SMGen -> (Text, SMGen)
generateFloat (GenFloatConst c) gen = (T.pack (show c), gen)
generateFloat (GenFloatRange lo hi prec) gen =
  let (val, gen') = generateFloatInRange lo hi prec gen
   in (T.pack (show val), gen')
generateFloat _ _ = error "Unhandled GenFloat type"

generateChar :: GenChar -> SMGen -> (Text, SMGen)
generateChar (GenCharConst c) gen = (T.singleton c, gen)
generateChar (GenCharVariety v) gen =
  let (c, gen') = generateCharFromList v gen
   in (T.singleton c, gen')
generateChar _ _ = error "Unhandled GenChar type"

generateStr :: GenStr -> SMGen -> (Text, SMGen)
generateStr (GenStr l a) gen =
  let (v, gen') = generateIntegral l gen
      len = read (T.unpack v) :: Int
      (charList, gen'') =
        foldl'
          ( \(acc, g) _ ->
              let (c, g') = generateCharFromList a g
               in (c : acc, g')
          )
          ("", gen')
          [0 .. len - 1]
   in (T.pack (reverse charList), gen'')
generateStr (GenStrConst s) gen = (s, gen)
generateStr _ _ = error "Unhandled GenStr type"

generateBool :: GenBool -> Language -> SMGen -> (Text, SMGen)
generateBool (GenBoolConst b) lang gen = (if lang /= Python3 then T.toLower (T.pack (show b)) else T.pack (show b), gen)
generateBool GenBoolGen lang gen =
  let (w, gen') = nextWord64 gen
      val = even w
   in (if lang /= Python3 then T.toLower $ T.pack (show val) else T.pack (show val), gen')

generateArr :: GenArr -> Language -> SMGen -> (Text, SMGen)
generateArr (GenArr distinct sortedRows l (GenArrInfo inner) et) lang gen =
  let (v, gen') = generateIntegral l gen
      len = read (T.unpack v) :: Int
      (rows, gen'') = generateNestedRows distinct len inner lang gen'
      rendered = applySorted sortedRows rows
   in (renderNestedArr lang et rendered, gen'')
generateArr (GenArr True _ l (GenIntegralInfo (GenIntegralRange lo hi)) _) _ gen =
  let (v, gen') = generateIntegral l gen
      len = min (read (T.unpack v) :: Int) (fromIntegral (hi - lo + 1))
      (nums, gen'') = generateDistinctIntegrals len lo hi gen'
      result = T.intercalate ", " (map (T.pack . show) nums)
   in (result, gen'')
generateArr (GenArr False sortedVals l (GenIntegralInfo (GenIntegralRange lo hi)) _) _ gen =
  let (v, gen') = generateIntegral l gen
      len = read (T.unpack v) :: Int
      (nums, gen'') =
        foldl'
          ( \(acc, g) _ ->
              let (c, g') = generateIntegralInRange lo hi g
               in (c : acc, g')
          )
          ([], gen')
          [1 .. len]
      result = T.intercalate ", " (map (T.pack . show) (applySorted sortedVals (reverse nums)))
   in (result, gen'')
generateArr (GenArr False _ l (GenIntegralInfo (GenIntegralConst constVal)) _) _ gen =
  let (v, gen') = generateIntegral l gen
      len = read (T.unpack v) :: Int
      result = replicate len constVal
      formattedString = T.intercalate ", " (map (T.pack . show) result)
   in (formattedString, gen')
generateArr (GenArr True _ _ (GenIntegralInfo (GenIntegralConst constVal)) _) _ gen =
  (T.pack (show constVal), gen)
generateArr (GenArr True sortedVals l (GenFloatInfo (GenFloatRange lo hi p)) _) _ gen =
  let step = 1 / (10 ^ p)
      vec = V.fromList [lo, lo + step .. hi]
      (v, gen') = generateIntegral l gen
      len = min (read (T.unpack v) :: Int) (V.length vec)
      (shuffled, gen'') = fisherYates vec gen'
      nums = applySorted sortedVals (V.toList (V.take len shuffled))
      result = T.intercalate ", " (map (T.pack . show) nums)
   in (result, gen'')
generateArr (GenArr False sortedVals l (GenFloatInfo (GenFloatRange lo hi p)) _) _ gen =
  let (v, gen') = generateIntegral l gen
      len = read (T.unpack v) :: Int
      (nums, gen'') =
        foldl'
          ( \(acc, g) _ ->
              let (c, g') = generateFloatInRange lo hi p g
               in (c : acc, g')
          )
          ([], gen')
          [1 .. len]
      result = T.intercalate ", " (map (T.pack . show) (applySorted sortedVals (reverse nums)))
   in (result, gen'')
generateArr (GenArr False _ l (GenFloatInfo (GenFloatConst constVal)) _) _ gen =
  let (v, gen') = generateIntegral l gen
      len = read (T.unpack v) :: Int
      result = replicate len constVal
      formattedString = T.intercalate ", " (map (T.pack . show) result)
   in (formattedString, gen')
generateArr (GenArr True _ _ (GenFloatInfo (GenFloatConst constVal)) _) _ gen =
  (T.pack (show constVal), gen)
generateArr (GenArr False sortedVals l (GenCharInfo i) _) lang gen =
  let (v, gen') = generateIntegral l gen
      len = read (T.unpack v) :: Int
      (chars, gen'') =
        foldl'
          ( \(acc, g) _ ->
              let (s, g') = generateChar i g
               in (T.head s : acc, g')
          )
          ([], gen')
          [1 .. len]
      result = T.intercalate ", " (map (renderGeneratedCharElem lang) (applySorted sortedVals (reverse chars)))
   in (result, gen'')
generateArr (GenArr True sortedVals l (GenCharInfo (GenCharVariety alphabet)) _) lang gen =
  let vec = V.fromList (T.unpack alphabet)
      (v, gen') = generateIntegral l gen
      len = min (read (T.unpack v) :: Int) (V.length vec)
      (shuffled, gen'') = fisherYates vec gen'
      chars = applySorted sortedVals (V.toList (V.take len shuffled))
      result = T.intercalate ", " (map (renderGeneratedCharElem lang) chars)
   in (result, gen'')
generateArr (GenArr True _ _ (GenCharInfo (GenCharConst c)) _) lang gen =
  (renderGeneratedCharElem lang c, gen)
generateArr (GenArr False sortedVals l (GenStrInfo val) _) _ gen =
  let (v, gen') = generateIntegral l gen
      len = read (T.unpack v) :: Int
      (strs, gen'') =
        foldl'
          ( \(acc, g) _ ->
              let (s, g') = generateStr val g
               in (s : acc, g')
          )
          ([], gen')
          [1 .. len]
      result = T.intercalate ", " (applySorted sortedVals (reverse strs))
   in (result, gen'')
generateArr (GenArr True sortedVals l (GenStrInfo val) _) _ gen =
  let (v, gen') = generateIntegral l gen
      len = read (T.unpack v) :: Int
      (strs, gen'') = go S.empty [] len gen'
      rendered = applySorted sortedVals (reverse strs)
   in (T.intercalate ", " rendered, gen'')
  where
    go _ acc 0 g = (acc, g)
    go seen acc n g =
      let (s, g') = generateStr val g
       in if S.member s seen
            then go seen acc n g'
            else go (S.insert s seen) (s : acc) (n - 1) g'
generateArr (GenArr False sortedVals l (GenBoolInfo i) _) lang gen =
  let (v, gen') = generateIntegral l gen
      len = read (T.unpack v) :: Int
      (bools, gen'') =
        foldl'
          ( \(acc, g) _ ->
              let (s, g') = generateBool i lang g
               in (s : acc, g')
          )
          ([], gen')
          [1 .. len]
      result = T.intercalate ", " (applySorted sortedVals (reverse bools))
   in (if lang /= Python3 then T.toLower result else result, gen'')
generateArr (GenArr True sortedVals l (GenBoolInfo i) _) lang gen =
  let (v, gen') = generateIntegral l gen
      len = min (read (T.unpack v) :: Int) 2
      pool = case i of
        GenBoolConst b -> [b]
        GenBoolGen -> [True, False]
      vec = V.fromList pool
      (shuffled, gen'') = fisherYates vec gen'
      actualLen = min len (V.length shuffled)
      vals = applySorted sortedVals (V.toList (V.take actualLen shuffled))
      result = T.intercalate ", " (map (T.pack . show) vals)
   in (if lang /= Python3 then T.toLower result else result, gen'')

generateIntegralInRange :: Integer -> Integer -> SMGen -> (Integer, SMGen)
generateIntegralInRange lo hi gen =
  let (w, gen') = nextWord64 gen
      range = fromIntegral (hi - lo + 1) :: Word64
      val = lo + fromIntegral (mod w range)
   in (val, gen')

generateDistinctIntegrals :: Int -> Integer -> Integer -> SMGen -> ([Integer], SMGen)
generateDistinctIntegrals len lo hi = go S.empty [] len
  where
    go seen acc remaining g
      | remaining <= 0 = (reverse acc, g)
      | otherwise =
          let (val, g') = generateIntegralInRange lo hi g
           in if S.member val seen
                then go seen acc remaining g'
                else go (S.insert val seen) (val : acc) (remaining - 1) g'

generateFloatInRange :: Double -> Double -> Int -> SMGen -> (Double, SMGen)
generateFloatInRange lo hi prec gen =
  let factor = (10 :: Integer) ^ prec
      loI = round (lo * fromIntegral factor) :: Integer
      hiI = round (hi * fromIntegral factor) :: Integer
      (n, gen') = generateIntegralInRange loI hiI gen
      val = fromIntegral n / fromIntegral factor :: Double
   in (val, gen')

generateCharFromList :: Text -> SMGen -> (Char, SMGen)
generateCharFromList xs gen =
  let (it, gen') = generateIntegralInRange 0 (fromIntegral (T.length xs - 1) :: Integer) gen
   in (T.index xs (fromIntegral it), gen')

fisherYates :: V.Vector a -> SMGen -> (V.Vector a, SMGen)
fisherYates vec gen = foldl' step (vec, gen) [0 .. V.length vec - 2]
  where
    step (v, g) i =
      let (j, g') = generateIntegralInRange (fromIntegral i) (fromIntegral (V.length v - 1)) g
          j' = fromIntegral j
          v' = v V.// [(i, v V.! j'), (j', v V.! i)]
       in (v', g')

applySorted :: (Ord a) => Bool -> [a] -> [a]
applySorted shouldSort xs = if shouldSort then sort xs else xs

generateNestedRows :: Bool -> Int -> GenArr -> Language -> SMGen -> ([Text], SMGen)
generateNestedRows distinct len inner lang gen
  | distinct = goDistinct S.empty [] len (len * 20 + 100) gen
  | otherwise =
      let (rows, g') =
            foldl'
              ( \(acc, g) _ ->
                  let (row, g'') = generateArr inner lang g
                   in (row : acc, g'')
              )
              ([] :: [Text], gen)
              [1 .. len]
       in (reverse rows, g')
  where
    goDistinct _ acc 0 _ g = (reverse acc, g)
    goDistinct _ acc _ 0 g = (reverse acc, g)
    goDistinct seen acc remaining attempts g =
      let (row, g') = generateArr inner lang g
       in if S.member row seen
            then goDistinct seen acc remaining (attempts - 1) g'
            else goDistinct (S.insert row seen) (row : acc) (remaining - 1) (attempts - 1) g'
