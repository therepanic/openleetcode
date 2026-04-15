module CLI.Submit where

import Core.Types (Language)

data SubmitOpts = SubmitOpts
  { submitPath :: FilePath,
    submitId :: Maybe Int,
    submitTitle :: Maybe String,
    submitLang :: Maybe Language
  }

run :: SubmitOpts -> IO ()
run opts = do
  return ()
