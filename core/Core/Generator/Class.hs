module Core.Generator.Class where

import Core.Types
import Data.Map as M

data GenInt = GenIntRange {intMin :: Int, intMax :: Int} | GenIntConst Int

data GenFloat = GenFloatRange {floatMin :: Double, floatMax :: Double, floatPrecision :: Int} | GenFloatConst Double

data GenStr = GenStr {strLen :: GenInt, strAlphabet :: [Char]}

data GenChar = GenCharVariety {charVariety :: [Char]} | GenCharConst Char

data GenArray = GenArray {arrDistinct :: Bool, arrSorted :: Bool, arrLen :: GenInt, arrOf :: GenInfo}

data GenInfo
  = GenIntInfo GenInt
  | GenFloatInfo GenFloat
  | GenCharInfo GenChar
  | GenStrInfo GenStr
  | GenArrayInfo GenArray

data GenData = GenData {lang :: Language, seed :: Int, info :: M.Map String GenInfo}

newtype GenResult = GenResult {result :: M.Map String String}

class Generator where
  generate :: GenData -> GenResult
