{-# LANGUAGE OverloadedStrings #-}

module Core.Test.Types where

import Core.Types
import Data.Aeson
import Data.Aeson.Types (Parser)
import Data.ByteString.Lazy qualified as BL
import Data.Map qualified as M
import Data.Text (Text)
import Data.Text qualified as T
import Data.Text.Encoding qualified as T
import Data.Vector (toList)

data JudgeType = Exact | IgnoreOrder

newtype Judge = Judge {jType :: JudgeType}

data TestLimits = TestLimits {tlTimeMs :: Int, tlMemoryMb :: Int}

data TestEntry = TestEntry {teId :: Int, teTitle :: Text, teParams :: Maybe (M.Map Text TestParams), teCall :: M.Map Language Text}

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

data GIDStr = GIDStrGen {gidStrLen :: GIDIntegral, gidStrAlphabet :: Text} | GIDStrConst Text

data GIDChar
  = GIDGenCharVariety {gidGenCharVariety :: Text}
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

data TestCaseInData = InCase Text | InGenerated GeneratedInData | InConst GeneratedInData

newtype TestCaseOutData = OutCase Text

type TestCaseIn = (Text, TestCaseInData)

data TestOracleEntry = TestOracleEntry {call :: Text, checker :: Text}

type TestOracle = M.Map Language TestOracleEntry

data TestParamsType = TPTInt | TPTFloat | TPTDouble | TPTLong | TPTString | TPTChar | TPTBool | TPTArray | TPTListNode | TPTTreeNode

data TestParams = TestParams {tpaType :: TestParamsType, tpaItems :: Maybe TestParams}

data TestCase
  = TestCase
  { tcName :: Text,
    tcJudge :: Maybe Judge,
    tcCall :: Maybe (M.Map Language Text),
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
      "exact" -> pure Exact
      "ignore_order" -> pure IgnoreOrder
      _ -> fail $ "unknown judge type: " <> T.unpack t

instance FromJSON Judge where
  parseJSON = withObject "Judge" $ \o -> do
    t <- o .: "type"
    pure $ Judge t

instance FromJSON TestLimits where
  parseJSON = withObject "TestLimits" $ \o -> do
    time <- o .: "time_ms"
    memory <- o .: "memory_mb"
    pure $ TestLimits time memory

instance FromJSON TestEntry where
  parseJSON = withObject "TestEntry" $ \o -> do
    id' <- o .: "id"
    title <- o .: "title"
    params <- o .:? "params"
    call <- o .: "call"
    pure $ TestEntry id' title params call

instance FromJSON TestCaseOutData where
  parseJSON (String t) = pure $ OutCase t
  parseJSON v = pure $ OutCase (T.decodeUtf8 (BL.toStrict (encode v)))

instance FromJSON GIDIntegral where
  parseJSON (Number n) = pure $ GIDGenIntegralConst (round n)
  parseJSON (Object o) = do
    gen <- o .: "gen" :: Parser Text
    case gen of
      "int" -> GIDGenIntegralRange <$> o .: "min" <*> o .: "max"
      _ -> fail $ "unknown gen for integral: " <> T.unpack gen
  parseJSON _ = fail "expected number or object"

instance FromJSON GIDBool where
  parseJSON (Bool v) = pure $ GIDGenBoolConst v
  parseJSON (Object o) = do
    gen <- o .: "gen" :: Parser Text
    case gen of
      "bool" -> pure GIDGenBoolGen
      _ -> fail $ "unknown gen for bool: " <> T.unpack gen
  parseJSON _ = fail "expected bool or object"

instance FromJSON GIDFloat where
  parseJSON (Number n) = pure $ GIDGenFloatConst (realToFrac n)
  parseJSON (Object o) = do
    gen <- o .: "gen" :: Parser Text
    case gen of
      "float" -> GIDGenFloatRange <$> o .: "min" <*> o .: "max" <*> (o .:? "precision" .!= 0)
      _ -> fail $ "unknown gen for float: " <> T.unpack gen
  parseJSON _ = fail "expected number or object"

instance FromJSON GIDChar where
  parseJSON v@(String _) = GIDGenCharConst <$> parseJSON v
  parseJSON (Object o) = do
    gen <- o .: "gen" :: Parser Text
    case gen of
      "char" -> GIDGenCharVariety . T.concat <$> (o .: "variety")
      _ -> fail $ "unknown gen for char: " <> T.unpack gen
  parseJSON _ = fail "expected number or object"

instance FromJSON GIDArr where
  parseJSON (Array vec) = GIDArrConst <$> mapM parseJSON (toList vec) <*> pure Nothing
  parseJSON (Object o) = do
    elemType <- o .:? "elemType"
    valueVals <- o .:? "value"
    case valueVals of
      Just vals -> pure $ GIDArrConst vals elemType
      Nothing -> do
        distinct <- o .:? "distinct" .!= False
        sorted <- o .:? "sorted" .!= False
        len <- o .: "len"
        of' <- o .: "of"
        pure $ GIDArrGen distinct sorted len of' elemType

instance FromJSON GIDStr where
  parseJSON (String t) = pure $ GIDStrConst t
  parseJSON (Object o) = GIDStrGen <$> o .: "len" <*> o .: "alphabet"
  parseJSON _ = fail "expected string or object for GIDStr"

instance FromJSON GeneratedInData where
  parseJSON (Number n) = pure $ GIDIntegral (GIDGenIntegralConst (round n))
  parseJSON (Bool b) = pure $ GIDBool (GIDGenBoolConst b)
  parseJSON Null = pure GIDNull
  parseJSON (Array vec) = GIDArr <$> parseJSON (Array vec)
  parseJSON (String t) = pure $ GIDStr (GIDStrConst t)
  parseJSON (Object o) = do
    gen <- o .: "gen" :: Parser Text
    case gen of
      "int" -> GIDIntegral <$> parseJSON (Object o)
      "float" -> GIDFloat <$> parseJSON (Object o)
      "str" -> GIDStr <$> parseJSON (Object o)
      "char" -> GIDChar <$> parseJSON (Object o)
      "array" -> GIDArr <$> parseJSON (Object o)
      "bool" -> GIDBool <$> parseJSON (Object o)
      _ -> fail $ "unknown gen: " <> T.unpack gen
  parseJSON _ = fail "expected string or object for GeneratedInData"

instance FromJSON TestCaseInData where
  parseJSON (Object o) = do
    gen <- o .:? "gen" :: Parser (Maybe Text)
    valueVals <- o .:? "value" :: Parser (Maybe Value)
    case (gen, valueVals) of
      (Just "array", Just _) -> InConst . GIDArr <$> parseJSON (Object o)
      (Nothing, Just _) -> InConst . GIDArr <$> parseJSON (Object o)
      (Just _, _) -> InGenerated <$> parseJSON (Object o)
      (Nothing, _) -> pure $ InCase (jsonToText (Object o))
  parseJSON (Array vec) = InConst . GIDArr <$> parseJSON (Array vec)
  parseJSON (String t) = pure $ InCase t
  parseJSON v = pure $ InCase (jsonToText v)

jsonToText :: Value -> Text
jsonToText = T.decodeUtf8 . BL.toStrict . encode

instance FromJSON TestCase where
  parseJSON = withObject "TestCase" $ \o -> do
    name <- o .: "name"
    judge <- o .:? "judge"
    call <- o .:? "call"
    inMap <- o .: "in" :: Parser (M.Map Text TestCaseInData)
    seed <- o .:? "seed"
    out <- o .:? "out"
    pure $ TestCase name judge call (M.toList inMap) seed out

instance FromJSON TestParams where
  parseJSON = withObject "TestParams" $ \o -> do
    type' <- o .: "type"
    items <- o .:? "items"
    pure $ TestParams type' items

instance FromJSON TestParamsType where
  parseJSON = withText "TestParamsType" $ \t -> case t of
    "int" -> pure TPTInt
    "long" -> pure TPTLong
    "double" -> pure TPTDouble
    "float" -> pure TPTFloat
    "string" -> pure TPTString
    "char" -> pure TPTChar
    "bool" -> pure TPTBool
    "array" -> pure TPTArray
    "tree_node" -> pure TPTTreeNode
    "list_node" -> pure TPTListNode
    _ -> fail $ "unknown elemType: " <> T.unpack t

instance FromJSON TestSuite where
  parseJSON = withObject "TestSuite" $ \o -> do
    entry <- o .: "entry"
    judge <- o .: "judge"
    limits <- o .: "limits"
    oracle <- o .: "oracle"
    seed <- o .: "seed"
    tests <- o .: "tests"
    pure $ TestSuite entry judge limits oracle seed tests

instance FromJSON TestOracleEntry where
  parseJSON = withObject "TestOracleEntry" $ \o -> do
    call <- o .: "call"
    checker <- o .: "checker"
    pure $ TestOracleEntry call checker

instance FromJSON GIDArrElemType where
  parseJSON = withText "GIDArrElemType" $ \t -> case t of
    "int" -> pure GIDArrElemInt
    "long" -> pure GIDArrElemLong
    "double" -> pure GIDArrElemDouble
    "float" -> pure GIDArrElemFloat
    "string" -> pure GIDArrElemString
    "char" -> pure GIDArrElemChar
    "bool" -> pure GIDArrElemBool
    _ -> fail $ "unknown elemType: " <> T.unpack t
