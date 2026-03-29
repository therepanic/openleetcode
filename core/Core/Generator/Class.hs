module Core.Generator.Class where

import Core.Types
import Data.Map as M

data GenIntegral = GenIntegralRange {intMin :: Integer, intMax :: Integer} | GenIntegralConst Integer

data GenFloat = GenFloatRange {floatMin :: Double, floatMax :: Double, floatPrecision :: Int} | GenFloatConst Double

data GenStr = GenStr {strLen :: GenIntegral, strAlphabet :: [Char]}

data GenChar = GenCharVariety {charVariety :: [Char]} | GenCharConst Char

data GenArray = GenArray {arrDistinct :: Bool, arrLen :: GenIntegral, arrOf :: GenInfo}

data GenInfo
  = GenIntegralInfo GenIntegral
  | GenFloatInfo GenFloat
  | GenCharInfo GenChar
  | GenStrInfo GenStr
  | GenArrayInfo GenArray

data GenData = GenData {lang :: Language, seed :: Int, info :: M.Map String GenInfo}

newtype GenResult = GenResult {result :: M.Map String String}

class Generator where
  generate :: GenData -> GenResult
