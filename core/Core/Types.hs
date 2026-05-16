{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Core.Types where

import Data.Aeson
import Data.Aeson.Types (toJSONKeyText)
import Data.Text (pack)

data ExecutorType = Piston

data Language = Python3 | Python2 | Ruby | Java | CSharp | Go | Dart | Kotlin | Swift | Cpp | Rust | TypeScript | Default
  deriving (Show, Eq, Ord)

convertLangToStr :: Language -> String
convertLangToStr lang = case lang of
  Python3 -> "python3"
  Cpp -> "cpp"
  Python2 -> "python2"
  Ruby -> "ruby"
  Java -> "java"
  CSharp -> "csharp"
  Go -> "go"
  Dart -> "dart"
  Kotlin -> "kotlin"
  Swift -> "swift"
  Rust -> "rust"
  TypeScript -> "typescript"

convertStrToLang :: String -> Maybe Language
convertStrToLang s = case s of
  "python3" -> Just Python3
  "python2" -> Just Python2
  "cpp" -> Just Cpp
  "rust" -> Just Rust
  "ruby" -> Just Ruby
  "java" -> Just Java
  "csharp" -> Just CSharp
  "go" -> Just Go
  "dart" -> Just Dart
  "kotlin" -> Just Kotlin
  "swift" -> Just Swift
  "typescript" -> Just TypeScript
  _ -> Nothing

convertExtToLangMaybe :: String -> Maybe Language
convertExtToLangMaybe ext = case ext of
  ".py" -> Just Python3
  ".rb" -> Just Ruby
  ".cpp" -> Just Cpp
  ".c++" -> Just Cpp
  ".rs" -> Just Rust
  ".cc" -> Just Cpp
  ".java" -> Just Java
  ".cs" -> Just CSharp
  ".go" -> Just Go
  ".dart" -> Just Dart
  ".kt" -> Just Kotlin
  ".swift" -> Just Swift
  ".ts" -> Just TypeScript
  _ -> Nothing

convertLangToExt :: Language -> String
convertLangToExt lang = case lang of
  Python3 -> ".py"
  Python2 -> ".py"
  Ruby -> ".rb"
  Rust -> ".rs"
  Cpp -> ".cpp"
  Java -> ".java"
  CSharp -> ".cs"
  Go -> ".go"
  Dart -> ".dart"
  Kotlin -> ".kt"
  Swift -> ".swift"
  TypeScript -> ".ts"

nullLiteral :: Language -> String
nullLiteral Python3 = "None"
nullLiteral Python2 = "None"
nullLiteral Rust = "None"
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
      "rust" -> pure Rust
      "ruby" -> pure Ruby
      "java" -> pure Java
      "csharp" -> pure CSharp
      "go" -> pure Go
      "dart" -> pure Dart
      "kotlin" -> pure Kotlin
      "swift" -> pure Swift
      "typescript" -> pure TypeScript
      _ -> pure Default

instance FromJSONKey Language where
  fromJSONKey = FromJSONKeyTextParser $ \t ->
    case t of
      "python" -> pure Python3
      "python2" -> pure Python2
      "cpp" -> pure Cpp
      "c++" -> pure Cpp
      "rust" -> pure Rust
      "python3" -> pure Python3
      "ruby" -> pure Ruby
      "java" -> pure Java
      "csharp" -> pure CSharp
      "go" -> pure Go
      "dart" -> pure Dart
      "kotlin" -> pure Kotlin
      "swift" -> pure Swift
      "typescript" -> pure TypeScript
      _ -> pure Default

instance ToJSON Language where
  toJSON Python3 = "python"
  toJSON Python2 = "python2"
  toJSON Ruby = "ruby"
  toJSON Cpp = "c++"
  toJSON Rust = "rust"
  toJSON Java = "java"
  toJSON CSharp = "csharp"
  toJSON Go = "go"
  toJSON Dart = "dart"
  toJSON Kotlin = "kotlin"
  toJSON Swift = "swift"
  toJSON TypeScript = "typescript"

instance ToJSONKey Language where
  toJSONKey :: ToJSONKeyFunction Language
  toJSONKey = toJSONKeyText $ \l ->
    case l of
      Python3 -> "python"
      Python2 -> "python2"
      Ruby -> "ruby"
      Rust -> "rust"
      Cpp -> "c++"
      Java -> "java"
      CSharp -> "csharp"
      Go -> "go"
      Dart -> "dart"
      Kotlin -> "kotlin"
      Swift -> "swift"
      TypeScript -> "typescript"
