{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Core.Types where

import Data.Aeson
import Data.Aeson.Types (toJSONKeyText)

data Language = Python3 | Python | Ruby | Java | Go | Dart | Kotlin | Swift
  deriving (Show, Eq, Ord)

parseLang :: String -> Maybe Language
parseLang s = case s of
  "python3" -> Just Python3
  "python" -> Just Python
  "ruby" -> Just Ruby
  "java" -> Just Java
  "go" -> Just Go
  "dart" -> Just Dart
  "kotlin" -> Just Kotlin
  "swift" -> Just Swift
  _ -> Nothing

determineLanguage :: String -> Language
determineLanguage ext = case ext of
  ".py" -> Python3
  ".rb" -> Ruby
  ".java" -> Java
  ".go" -> Go
  ".dart" -> Dart
  ".kt" -> Kotlin
  ".swift" -> Swift
  _ -> error $ "Unknown extension: " <> ext

instance FromJSON Language where
  parseJSON = withText "Language" $ \t ->
    case t of
      "python3" -> pure Python3
      "python" -> pure Python
      "ruby" -> pure Ruby
      "java" -> pure Java
      "go" -> pure Go
      "dart" -> pure Dart
      "kotlin" -> pure Kotlin
      "swift" -> pure Swift
      _ -> fail "Unknown language"

instance ToJSON Language where
  toJSON Python3 = "python3"
  toJSON Python = "python"
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
      "python" -> pure Python
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
      Python -> "python"
      Ruby -> "ruby"
      Java -> "java"
      Go -> "go"
      Dart -> "dart"
      Kotlin -> "kotlin"
      Swift -> "swift"
