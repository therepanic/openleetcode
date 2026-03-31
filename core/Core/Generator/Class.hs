module Core.Generator.Class where

import Core.Types

data GenIntegral = GenIntegralRange {intMin :: Integer, intMax :: Integer} | GenIntegralConst Integer

data GenBool = GenBoolConst Bool | GenBoolGen

data GenFloat = GenFloatRange {floatMin :: Double, floatMax :: Double, floatPrecision :: Int} | GenFloatConst Double

data GenStr = GenStr {strLen :: GenIntegral, strAlphabet :: [Char]}

data GenChar = GenCharVariety {charVariety :: [Char]} | GenCharConst Char

data GenArr = GenArr {arrDistinct :: Bool, arrLen :: GenIntegral, arrOf :: GenInfo}

data GenInfo
  = GenIntegralInfo GenIntegral
  | GenBoolInfo GenBool
  | GenFloatInfo GenFloat
  | GenCharInfo GenChar
  | GenStrInfo GenStr
  | GenArrInfo GenArr

data GenData = GenData {seed :: Int, info :: GenInfo, lang :: Language}

type GenResult = String

class Generator g where
  generate :: g -> GenData -> GenResult
