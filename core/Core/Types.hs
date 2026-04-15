{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Core.Types where

import Data.Aeson
import Data.Aeson.Types (toJSONKeyText)

data Language = Python3 | Python | Ruby | Java | Go | Dart
  deriving (Show, Eq, Ord)

parseLang :: String -> Either String Language
parseLang s = case s of
  "python3" -> Right Python3
  "python" -> Right Python
  "ruby" -> Right Ruby
  "java" -> Right Java
  "go" -> Right Go
  "dart" -> Right Dart
  _ -> Left $ "Unknown language: " <> s

instance FromJSON Language where
  parseJSON = withText "Language" $ \t ->
    case t of
      "python3" -> pure Python3
      "python" -> pure Python
      "ruby" -> pure Ruby
      "java" -> pure Java
      "go" -> pure Go
      "dart" -> pure Dart
      _ -> fail "Unknown language"

instance ToJSON Language where
  toJSON Python3 = "python3"
  toJSON Python = "python"
  toJSON Ruby = "ruby"
  toJSON Java = "java"
  toJSON Go = "go"
  toJSON Dart = "dart"

instance FromJSONKey Language where
  fromJSONKey = FromJSONKeyTextParser $ \t ->
    case t of
      "python3" -> pure Python3
      "python" -> pure Python
      "ruby" -> pure Ruby
      "java" -> pure Java
      "go" -> pure Go
      "dart" -> pure Dart
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
