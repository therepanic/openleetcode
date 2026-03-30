module Core.Test.Types where

import Core.Types
import Data.Map qualified as M

data JudgeType = Exact | IgnoreOrder | IgnoreOrderNested | IgnoreOrderAll

data Judge = Judge {jType :: JudgeType}

data TestLimits = TestLimits {tlTimeMs :: Int, tlMemoryMb :: Int}

data TestEntry = TestEntry {teId :: Int, teTitle :: String, teCall :: M.Map Language String}

data GeneratedInData
  = GIDIntegral GIDIntegral
  | GIDFloat GIDFloat
  | GIDStr {gidStrLen :: GIDIntegral, gidStrAlphabet :: [Char]}
  | GIDChar GIDChar
  | GIDArr {gidArrDistinct :: Bool, gidSorted :: Bool, gidArrLen :: GIDIntegral, gidArrOf :: GeneratedInData}

data GIDIntegral
  = GIDGenIntegralRange {gidGenIntMin :: Integer, gidGenIntMax :: Integer}
  | GIDGenIntegralConst Integer

data GIDFloat
  = GIDGenFloatRange {gidGenFloatMin :: Double, gidGenFloatMax :: Double, gidGenFloatPrecision :: Int}
  | GIDGenFloatConst Double

data GIDChar
  = GIDGenCharVariety {gidGenCharVariety :: [Char]}
  | GIDGenCharConst Char

data TestCaseInData = InCase String | InGenerated GeneratedInData

data TestCaseOutData = OutCase String

data TestCase
  = TestCase {tcName :: String, tcJudge :: Maybe Judge, tcIn :: [(String, TestCaseInData)], tcOut :: TestCaseOutData}

data TestSuite
  = TestSuite
  { tsEntry :: TestEntry,
    tsJudge :: Judge,
    tsLimits :: TestLimits,
    tsOracle :: M.Map Language String,
    tsSeed :: Maybe Int,
    tsCases :: [TestCase]
  }
