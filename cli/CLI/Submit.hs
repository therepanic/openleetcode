module CLI.Submit where

import Control.Monad (when)
import Core.Types (Language)
import Data.Maybe (isNothing)

data SubmitOpts = SubmitOpts
  { submitPath :: FilePath,
    submitId :: Maybe Int,
    submitTitle :: Maybe String,
    submitLang :: Maybe Language
  }

run :: SubmitOpts -> IO ()
run opts = do
  validateSubmit opts
  return ()

validateSubmit :: SubmitOpts -> IO ()
validateSubmit opts =
  when (isNothing (submitId opts) && isNothing (submitTitle opts)) $
    fail "Title or id must be entered"
