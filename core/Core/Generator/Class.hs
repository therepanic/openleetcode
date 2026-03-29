module Core.Generator.Class where

import Core.Types
import Data.Map as M

data GenInt = GenInt {intMin :: Int, intMax :: Int} | GenIntConst Int

data GenFloat = GenFloat {floatMin :: Double, floatMax :: Double, floatPrecision :: Int} | GenFloatConst Double

data GenArray = GenArray {arrDistinct :: Bool, arrSorted :: Bool, arrLen :: GenInt, arrOf :: GenInfo}

data GenStr = GenStr {strLen :: GenInt, strAlphabet :: String}

data GenInfo
  = GenIntInfo GenInt
  | GenFloatInfo GenFloat
  | GenArrayInfo GenArray
  | GenStrInfo GenStr

data GenData = GenData {lang :: Language, seed :: Int, info :: M.Map String GenInfo}

newtype GenResult = GenResult {result :: M.Map String String}

class Generator e where
  generate :: e -> GenData -> IO GenResult
