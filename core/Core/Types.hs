{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Core.Types where

import Data.Aeson

data Language = Python3 | Python | Ruby | Java
  deriving (Show, Eq, Ord)

instance FromJSON Language where
  parseJSON = withText "Language" $ \t ->
    case t of
      "python3" -> pure Python3
      "python" -> pure Python
      "ruby" -> pure Ruby
      "java" -> pure Java
      _ -> fail "Unknown language"

instance ToJSON Language where
  toJSON Python3 = "python3"
  toJSON Python = "python"
  toJSON Ruby = "ruby"
  toJSON Java = "java"
