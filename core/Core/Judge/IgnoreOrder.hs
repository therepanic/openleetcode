module Core.Judge.IgnoreOrder where

import Core.Judge.Class
import Data.Aeson
import Data.ByteString.Lazy.Char8 qualified as BS
import Data.List (sort)
import Data.Vector qualified as V

data IgnoreOrder = IgnoreOrder

sortValue :: Value -> Value
sortValue (Array vs) = Array . V.fromList . sort . map sortValue . V.toList $ vs
sortValue other = other

instance Judge IgnoreOrder where
  judge _ expected actual =
    case (decode (BS.pack expected), decode (BS.pack actual)) of
      (Just e, Just a) ->
        if sortValue e == sortValue a
          then Pass
          else Fail ("expected: " ++ show expected ++ " got: " ++ show actual)
      _ -> Fail "failed to parse json"
