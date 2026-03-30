module Core.Test.Loader where

import Core.Test.Types
import Data.Yaml (ParseException, decodeFileEither)

loadTestSuite :: FilePath -> IO TestSuite
loadTestSuite path = do
  result <- decodeFileEither path :: IO (Either ParseException TestSuite)
  case result of
    Left err -> fail $ "failed to load test suite: " ++ show err
    Right ts -> return ts
