{-# LANGUAGE OverloadedStrings #-}

module Core.Test.Types where

import Core.Types
import Data.Aeson
import Data.Aeson.Types (Parser)
import Data.ByteString.Lazy.Char8 qualified as BL
import Data.Map qualified as M
import Data.Text qualified as T

data JudgeType = Exact | IgnoreOrder | IgnoreOrderNested | IgnoreOrderAll

data Judge = Judge {jType :: JudgeType}

data TestLimits = TestLimits {tlTimeMs :: Int, tlMemoryMb :: Int}

data TestEntry = TestEntry {teId :: Int, teTitle :: String, teCall :: M.Map Language String}

data GeneratedInData
  = GIDIntegral GIDIntegral
  | GIDFloat GIDFloat
  | GIDStr {gidStrLen :: GIDIntegral, gidStrAlphabet :: [Char]}
  | GIDChar GIDChar
  | GIDArr GIDArr

data GIDIntegral
  = GIDGenIntegralRange {gidGenIntMin :: Integer, gidGenIntMax :: Integer}
  | GIDGenIntegralConst Integer

data GIDFloat
  = GIDGenFloatRange {gidGenFloatMin :: Double, gidGenFloatMax :: Double, gidGenFloatPrecision :: Int}
  | GIDGenFloatConst Double

data GIDChar
  = GIDGenCharVariety {gidGenCharVariety :: [Char]}
  | GIDGenCharConst Char

data GIDArr
  = GidArrConst String
  | GIDArrGen {gidArrDistinct :: Bool, gidSorted :: Bool, gidArrLen :: GIDIntegral, gidArrOf :: GeneratedInData}

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

instance FromJSON JudgeType where
  parseJSON = withText "JudgeType" $ \t ->
    case t of
      "exact" -> return Exact
      "ignore_order" -> return IgnoreOrder
      "ignore_order_nested" -> return IgnoreOrderNested
      "ignore_order_all" -> return IgnoreOrderAll
      _ -> fail $ "unknown judge type: " <> show t

instance FromJSON Judge where
  parseJSON v = Judge <$> parseJSON v

instance FromJSON TestLimits where
  parseJSON = withObject "TestLimits" $ \o -> do
    time <- o .: "time_ms"
    memory <- o .: "memory_mb"
    return $ TestLimits time memory

instance FromJSON TestEntry where
  parseJSON = withObject "TestEntry" $ \o -> do
    id' <- o .: "id"
    title <- o .: "title"
    call <- o .: "call"
    return $ TestEntry id' title call

instance FromJSON TestCaseOutData where
  parseJSON (String t) = return $ OutCase (T.unpack t)
  parseJSON v = return $ OutCase (BL.unpack (encode v))

instance FromJSON GIDIntegral where
  parseJSON (Number n) = return $ GIDGenIntegralConst (round n)
  parseJSON (Object o) = do
    gen <- o .: "gen" :: Parser String
    case gen of
      "int" -> GIDGenIntegralRange <$> o .: "min" <*> o .: "max"
      _ -> fail $ "unknown gen for integral: " <> gen
  parseJSON _ = fail "expected number or object"

instance FromJSON GIDFloat where
  parseJSON (Number n) = return $ GIDGenFloatConst (realToFrac n)
  parseJSON (Object o) = do
    gen <- o .: "gen" :: Parser String
    case gen of
      "float" -> GIDGenFloatRange <$> o .: "min" <*> o .: "max" <*> o .: "precision"
      _ -> fail $ "unknown gen for float: " <> gen
  parseJSON _ = fail "expected number or object"

instance FromJSON GIDChar where
  parseJSON v@(String _) = GIDGenCharConst <$> parseJSON v
  parseJSON (Object o) = do
    gen <- o .: "gen" :: Parser String
    case gen of
      "char" -> GIDGenCharVariety <$> o .: "variety"
      _ -> fail $ "unknown gen for float: " <> gen
  parseJSON _ = fail "expected number or object"

instance FromJSON GIDArr where
  parseJSON (Object o) = do
    distinct <- o .: "distinct"
    sorted <- o .: "sorted"
    len <- o .: "len"
    of' <- o .: "of"
    return $ GIDArrGen distinct sorted len of'
  parseJSON (Array vec) =
    let s = BL.unpack (encode (Array vec))
     in return $ GidArrConst $ drop 1 $ init s
  parseJSON v = return $ GidArrConst (BL.unpack (encode v))

instance FromJSON GeneratedInData where
  parseJSON = withObject "GeneratedInData" $ \o -> do
    gen <- o .: "gen" :: Parser String
    case gen of
      "int" -> GIDIntegral <$> parseJSON (Object o)
      "float" -> GIDFloat <$> parseJSON (Object o)
      "str" -> GIDStr <$> o .: "len" <*> o .: "alphabet"
      "char" -> GIDChar <$> parseJSON (Object o)
      "array" -> GIDArr <$> parseJSON (Object o)
      _ -> fail $ "unknown gen: " <> gen

instance FromJSON TestCaseInData where
  parseJSON (Object o) = do
    gen <- o .:? "gen" :: Parser (Maybe String)
    case gen of
      Just _ -> InGenerated <$> parseJSON (Object o)
      Nothing -> InCase . BL.unpack . encode <$> pure (Object o)
  parseJSON (Array vec) =
    let s = BL.unpack (encode (Array vec))
     in return $ InCase $ drop 1 $ init s
  parseJSON (String t) = return $ InCase (T.unpack t)
  parseJSON v = return $ InCase (BL.unpack (encode v))

instance FromJSON TestCase where
  parseJSON = withObject "TestCase" $ \o -> do
    name <- o .: "name"
    judge <- o .:? "judge"
    inMap <- o .: "in" :: Parser (M.Map String TestCaseInData)
    out <- o .: "out"
    return $ TestCase name judge (M.toList inMap) out

instance FromJSON TestSuite where
  parseJSON = withObject "TestSuite" $ \o -> do
    entry <- o .: "entry"
    judge <- o .: "judge"
    limits <- o .: "limits"
    oracle <- o .: "oracle"
    seed <- o .:? "seed"
    tests <- o .: "tests"
    return $ TestSuite entry judge limits oracle seed tests
