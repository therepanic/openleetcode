{-# LANGUAGE OverloadedStrings #-}

module Core.Judge.Exact where

import Core.Judge.Class
import Data.Aeson (Value (..), decode)
import Data.Aeson qualified as Aeson
import Data.ByteString.Lazy.Char8 qualified as BS
import Data.Text qualified as T

data Exact = Exact

instance Judge Exact where
  judge _ expected actual =
    case compareJson expected actual of
      Just True -> Pass
      _ -> case (expected == actual, compareString expected actual) of
        (True, _) -> Pass
        (_, Just True) -> Pass
        _ -> Fail ("Expected: " <> expected <> " Got: " <> actual)

compareJson :: T.Text -> T.Text -> Maybe Bool
compareJson expected actual =
  case (decode (BS.pack (T.unpack expected)) :: Maybe Value, decode (BS.pack (T.unpack actual)) :: Maybe Value) of
    (Just e, Just a) -> Just (e == a)
    _ -> Nothing

compareString :: T.Text -> T.Text -> Maybe Bool
compareString expected actual =
  case (decode (BS.pack (T.unpack expected)) :: Maybe Value, decode (BS.pack (T.unpack actual)) :: Maybe Value) of
    (Nothing, Just (Aeson.String s)) -> Just (expected == s)
    (Just (Aeson.String s), Nothing) -> Just (actual == s)
    _ -> Nothing
