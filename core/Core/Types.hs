{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Core.Types where

import Data.Aeson
import Data.Aeson.Types (toJSONKeyText)
import Data.Text (pack)

data ExecutorType = Piston

data Language = Python3 | Ruby | Java | Go | Dart | Kotlin | Swift
  deriving (Show, Eq, Ord)

convertLangToStr :: Language -> String
convertLangToStr lang = case lang of
  Python3 -> "python3"
  Ruby -> "ruby"
  Java -> "java"
  Go -> "go"
  Dart -> "dart"
  Kotlin -> "kotlin"
  Swift -> "swift"

convertStrToLang :: String -> Maybe Language
convertStrToLang s = case s of
  "python3" -> Just Python3
  "ruby" -> Just Ruby
  "java" -> Just Java
  "go" -> Just Go
  "dart" -> Just Dart
  "kotlin" -> Just Kotlin
  "swift" -> Just Swift
  _ -> Nothing

convertExtToLang :: String -> Language
convertExtToLang ext = case ext of
  ".py" -> Python3
  ".rb" -> Ruby
  ".java" -> Java
  ".go" -> Go
  ".dart" -> Dart
  ".kt" -> Kotlin
  ".swift" -> Swift
  _ -> error $ "Unknown extension: " <> ext

convertLangToExt :: Language -> String
convertLangToExt lang = case lang of
  Python3 -> ".py"
  Ruby -> ".rb"
  Java -> ".java"
  Go -> ".go"
  Dart -> ".dart"
  Kotlin -> ".kt"
  Swift -> ".swift"

instance FromJSON ExecutorType where
  parseJSON = withText "BackendType" $ \t ->
    case t of
      "piston" -> pure Piston
      other -> fail $ "Unknown backend type: " ++ show other

instance ToJSON ExecutorType where
  toJSON :: ExecutorType -> Value
  toJSON Piston = toJSON (pack "piston")

instance Show ExecutorType where
  show Piston = "piston"

instance Read ExecutorType where
  readsPrec _ "piston" = [(Piston, "")]
  readsPrec _ _ = []

instance FromJSON Language where
  parseJSON = withText "Language" $ \t ->
    case t of
      "python3" -> pure Python3
      "ruby" -> pure Ruby
      "java" -> pure Java
      "go" -> pure Go
      "dart" -> pure Dart
      "kotlin" -> pure Kotlin
      "swift" -> pure Swift
      _ -> fail "Unknown language"

instance ToJSON Language where
  toJSON Python3 = "python3"
  toJSON Ruby = "ruby"
  toJSON Java = "java"
  toJSON Go = "go"
  toJSON Dart = "dart"
  toJSON Kotlin = "kotlin"
  toJSON Swift = "swift"

instance FromJSONKey Language where
  fromJSONKey = FromJSONKeyTextParser $ \t ->
    case t of
      "python3" -> pure Python3
      "ruby" -> pure Ruby
      "java" -> pure Java
      "go" -> pure Go
      "dart" -> pure Dart
      "kotlin" -> pure Kotlin
      "swift" -> pure Swift
      _ -> fail "Unknown language"

instance ToJSONKey Language where
  toJSONKey :: ToJSONKeyFunction Language
  toJSONKey = toJSONKeyText $ \l ->
    case l of
      Python3 -> "python3"
      Ruby -> "ruby"
      Java -> "java"
      Go -> "go"
      Dart -> "dart"
      Kotlin -> "kotlin"
      Swift -> "swift"
