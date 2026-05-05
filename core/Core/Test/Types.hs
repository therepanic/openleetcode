{-# LANGUAGE OverloadedStrings #-}

module Core.Test.Types where

import Core.Types
import Data.Aeson
import Data.Aeson.Types (Parser)
import Data.ByteString.Lazy.Char8 qualified as BL
import Data.Map qualified as M
import Data.Text qualified as T
import Data.Vector (toList)

data JudgeType = Exact | IgnoreOrder

data Judge = Judge {jType :: JudgeType}

data TestLimits = TestLimits {tlTimeMs :: Int, tlMemoryMb :: Int}

data TestEntry = TestEntry {teId :: Int, teTitle :: String, teCall :: M.Map Language String}

data GeneratedInData
  = GIDIntegral GIDIntegral
  | GIDFloat GIDFloat
  | GIDStr GIDStr
  | GIDChar GIDChar
  | GIDArr GIDArr
  | GIDBool GIDBool
  | GIDNull

data GIDIntegral
  = GIDGenIntegralRange {gidGenIntMin :: Integer, gidGenIntMax :: Integer}
  | GIDGenIntegralConst Integer

data GIDBool = GIDGenBoolConst Bool | GIDGenBoolGen

data GIDFloat
  = GIDGenFloatRange {gidGenFloatMin :: Double, gidGenFloatMax :: Double, gidGenFloatPrecision :: Int}
  | GIDGenFloatConst Double

data GIDStr = GIDStrGen {gidStrLen :: GIDIntegral, gidStrAlphabet :: [Char]} | GIDStrConst String

data GIDChar
  = GIDGenCharVariety {gidGenCharVariety :: [Char]}
  | GIDGenCharConst Char

data GIDArr
  = GIDArrConst {gidArrConstValues :: [GeneratedInData], gidArrConstElemType :: Maybe GIDArrElemType}
  | GIDArrGen {gidArrDistinct :: Bool, gidSorted :: Bool, gidArrLen :: GIDIntegral, gidArrOf :: GeneratedInData, gidElemType :: Maybe GIDArrElemType}

data GIDArrElemType
  = GIDArrElemInt
  | GIDArrElemLong
  | GIDArrElemDouble
  | GIDArrElemFloat
  | GIDArrElemString
  | GIDArrElemChar
  | GIDArrElemBool

data TestCaseInData = InCase String | InGenerated GeneratedInData | InConst GeneratedInData

newtype TestCaseOutData = OutCase String

type TestCaseIn = (String, TestCaseInData)

data TestOracleEntry = TestOracleEntry {call :: String, checker :: String}

type TestOracle = M.Map Language TestOracleEntry

data TestCase
  = TestCase
  { tcName :: String,
    tcJudge :: Maybe Judge,
    tcCall :: Maybe (M.Map Language String),
    tcIn :: [TestCaseIn],
    tcSeed :: Maybe Int,
    tcOut :: Maybe TestCaseOutData
  }

data TestSuite
  = TestSuite
  { tsEntry :: TestEntry,
    tsJudge :: Judge,
    tsLimits :: TestLimits,
    tsOracle :: TestOracle,
    tsSeed :: Int,
    tsCases :: [TestCase]
  }

instance FromJSON JudgeType where
  parseJSON = withText "JudgeType" $ \t ->
    case t of
      "exact" -> return Exact
      "ignore_order" -> return IgnoreOrder
      _ -> fail $ "unknown judge type: " <> show t

instance FromJSON Judge where
  parseJSON = withObject "Judge" $ \o -> do
    t <- o .: "type"
    return $ Judge t

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

instance FromJSON GIDBool where
  parseJSON (Bool v) = return $ GIDGenBoolConst v
  parseJSON (Object o) = do
    gen <- o .: "gen" :: Parser String
    case gen of
      "bool" -> return GIDGenBoolGen
      _ -> fail $ "unknown gen for bool: " <> gen
  parseJSON _ = fail "expected bool or object"

instance FromJSON GIDFloat where
  parseJSON (Number n) = return $ GIDGenFloatConst (realToFrac n)
  parseJSON (Object o) = do
    gen <- o .: "gen" :: Parser String
    case gen of
      "float" -> GIDGenFloatRange <$> o .: "min" <*> o .: "max" <*> (o .:? "precision" .!= 0)
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
  parseJSON (Array vec) = GIDArrConst <$> mapM parseJSON (toList vec) <*> pure Nothing
  parseJSON (Object o) = do
    elemType <- o .:? "elemType"
    constVals <- o .:? "const"
    case constVals of
      Just vals -> return $ GIDArrConst vals elemType
      Nothing -> do
        distinct <- o .:? "distinct" .!= False
        sorted <- o .:? "sorted" .!= False
        len <- o .: "len"
        of' <- o .: "of"
        return $ GIDArrGen distinct sorted len of' elemType

instance FromJSON GIDStr where
  parseJSON (String t) = return $ GIDStrConst (T.unpack t)
  parseJSON (Object o) = GIDStrGen <$> o .: "len" <*> o .: "alphabet"
  parseJSON _ = fail "expected string or object for GIDStr"

instance FromJSON GeneratedInData where
  parseJSON (Number n) = return $ GIDIntegral (GIDGenIntegralConst (round n))
  parseJSON (Bool b) = return $ GIDBool (GIDGenBoolConst b)
  parseJSON Null = return GIDNull
  parseJSON (Array vec) = GIDArr <$> parseJSON (Array vec)
  parseJSON (String t) = return $ GIDStr (GIDStrConst (T.unpack t))
  parseJSON (Object o) = do
    gen <- o .: "gen" :: Parser String
    case gen of
      "int" -> GIDIntegral <$> parseJSON (Object o)
      "float" -> GIDFloat <$> parseJSON (Object o)
      "str" -> GIDStr <$> parseJSON (Object o)
      "char" -> GIDChar <$> parseJSON (Object o)
      "array" -> GIDArr <$> parseJSON (Object o)
      "bool" -> GIDBool <$> parseJSON (Object o)
      _ -> fail $ "unknown gen: " <> gen
  parseJSON _ = fail "expected string or object for GeneratedInData"

instance FromJSON TestCaseInData where
  parseJSON (Object o) = do
    gen <- o .:? "gen" :: Parser (Maybe String)
    constVals <- o .:? "const" :: Parser (Maybe Value)
    case (gen, constVals) of
      (Just "array", Just _) -> InConst . GIDArr <$> parseJSON (Object o)
      (Just _, _) -> InGenerated <$> parseJSON (Object o)
      (Nothing, _) -> InCase . BL.unpack . encode <$> pure (Object o)
  parseJSON (Array vec) = InConst . GIDArr <$> parseJSON (Array vec)
  parseJSON (String t) = return $ InCase (T.unpack t)
  parseJSON v = return $ InCase (BL.unpack (encode v))

instance FromJSON TestCase where
  parseJSON = withObject "TestCase" $ \o -> do
    name <- o .: "name"
    judge <- o .:? "judge"
    call <- o .:? "call"
    inMap <- o .: "in" :: Parser (M.Map String TestCaseInData)
    seed <- o .:? "seed"
    out <- o .:? "out"
    return $ TestCase name judge call (M.toList inMap) seed out

instance FromJSON TestSuite where
  parseJSON = withObject "TestSuite" $ \o -> do
    entry <- o .: "entry"
    judge <- o .: "judge"
    limits <- o .: "limits"
    oracle <- o .: "oracle"
    seed <- o .: "seed"
    tests <- o .: "tests"
    return $ TestSuite entry judge limits oracle seed tests

instance FromJSON TestOracleEntry where
  parseJSON = withObject "TestOracleEntry" $ \o -> do
    call <- o .: "call"
    checker <- o .: "checker"
    return $ TestOracleEntry call checker

instance FromJSON GIDArrElemType where
  parseJSON = withText "GIDArrElemType" $ \t -> case t of
    "int" -> return GIDArrElemInt
    "long" -> return GIDArrElemLong
    "double" -> return GIDArrElemDouble
    "float" -> return GIDArrElemFloat
    "string" -> return GIDArrElemString
    "char" -> return GIDArrElemChar
    "bool" -> return GIDArrElemBool
    _ -> fail $ "unknown elemType: " <> show t
