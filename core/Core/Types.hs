{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Core.Types where

import Data.Aeson
import Data.Aeson.Types (toJSONKeyText)
import Data.Text (pack)

data ExecutorType = Piston

data Language = Python3 | Python2 | Ruby | Java | Go | Dart | Kotlin | Swift | Cpp | Default
  deriving (Show, Eq, Ord)

convertLangToStr :: Language -> String
convertLangToStr lang = case lang of
  Python3 -> "python3"
  Cpp -> "cpp"
  Python2 -> "python2"
  Ruby -> "ruby"
  Java -> "java"
  Go -> "go"
  Dart -> "dart"
  Kotlin -> "kotlin"
  Swift -> "swift"

convertStrToLang :: String -> Maybe Language
convertStrToLang s = case s of
  "python3" -> Just Python3
  "python2" -> Just Python2
  "cpp" -> Just Cpp
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
  ".cpp" -> Cpp
  ".c++" -> Cpp
  ".cc" -> Cpp
  ".java" -> Java
  ".go" -> Go
  ".dart" -> Dart
  ".kt" -> Kotlin
  ".swift" -> Swift
  _ -> error $ "Unknown extension: " <> ext

convertLangToExt :: Language -> String
convertLangToExt lang = case lang of
  Python3 -> ".py"
  Python2 -> ".py"
  Ruby -> ".rb"
  Cpp -> ".cpp"
  Java -> ".java"
  Go -> ".go"
  Dart -> ".dart"
  Kotlin -> ".kt"
  Swift -> ".swift"

nullLiteral :: Language -> String
nullLiteral Python3 = "None"
nullLiteral Python2 = "None"
nullLiteral Cpp = "nullopt"
nullLiteral Go = "nil"
nullLiteral Ruby = "nil"
nullLiteral Swift = "nil"
nullLiteral _ = "null"

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
      "python" -> pure Python3
      "python2" -> pure Python2
      "cpp" -> pure Cpp
      "c++" -> pure Cpp
      "ruby" -> pure Ruby
      "java" -> pure Java
      "go" -> pure Go
      "dart" -> pure Dart
      "kotlin" -> pure Kotlin
      "swift" -> pure Swift
      _ -> pure Default

instance FromJSONKey Language where
  fromJSONKey = FromJSONKeyTextParser $ \t ->
    case t of
      "python" -> pure Python3
      "python2" -> pure Python2
      "cpp" -> pure Cpp
      "c++" -> pure Cpp
      "python3" -> pure Python3
      "ruby" -> pure Ruby
      "java" -> pure Java
      "go" -> pure Go
      "dart" -> pure Dart
      "kotlin" -> pure Kotlin
      "swift" -> pure Swift
      _ -> pure Default

instance ToJSON Language where
  toJSON Python3 = "python"
  toJSON Python2 = "python2"
  toJSON Ruby = "ruby"
  toJSON Cpp = "c++"
  toJSON Java = "java"
  toJSON Go = "go"
  toJSON Dart = "dart"
  toJSON Kotlin = "kotlin"
  toJSON Swift = "swift"

instance ToJSONKey Language where
  toJSONKey :: ToJSONKeyFunction Language
  toJSONKey = toJSONKeyText $ \l ->
    case l of
      Python3 -> "python"
      Python2 -> "python2"
      Ruby -> "ruby"
      Cpp -> "c++"
      Java -> "java"
      Go -> "go"
      Dart -> "dart"
      Kotlin -> "kotlin"
      Swift -> "swift"
