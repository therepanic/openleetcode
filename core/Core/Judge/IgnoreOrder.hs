{-# LANGUAGE OverloadedStrings #-}

module Core.Judge.IgnoreOrder where

import Core.Judge.Class
import Data.Aeson
import Data.ByteString.Lazy.Char8 qualified as BS
import Data.List (sort)
import Data.Text qualified as T
import Data.Vector qualified as V

data IgnoreOrder = IgnoreOrder

instance Judge IgnoreOrder where
  judge _ expected actual =
    case (decode (BS.pack (T.unpack expected)), decode (BS.pack (T.unpack actual))) of
      (Just e, Just a) ->
        if sortValue e == sortValue a
          then Pass
          else Fail ("Output: " <> T.pack (show actual) <> " Expected: " <> T.pack (show expected))
      _ -> Fail "Failed to parse json"

sortValue :: Value -> Value
sortValue (Array vs) = Array . V.fromList . sort . map sortValue . V.toList $ vs
sortValue other = other
