{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Core.Types where

import Data.Aeson
import Data.Aeson.Types (toJSONKeyText)

data Language = Python3 | Python | Ruby | Java | Go
  deriving (Show, Eq, Ord)

instance FromJSON Language where
  parseJSON = withText "Language" $ \t ->
    case t of
      "python3" -> pure Python3
      "python" -> pure Python
      "ruby" -> pure Ruby
      "java" -> pure Java
      "go" -> pure Go
      _ -> fail "Unknown language"

instance ToJSON Language where
  toJSON Python3 = "python3"
  toJSON Python = "python"
  toJSON Ruby = "ruby"
  toJSON Java = "java"
  toJSON Go = "go"

instance FromJSONKey Language where
  fromJSONKey = FromJSONKeyTextParser $ \t ->
    case t of
      "python3" -> pure Python3
      "python" -> pure Python
      "ruby" -> pure Ruby
      "java" -> pure Java
      "go" -> pure Go
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
