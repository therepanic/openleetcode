{-# LANGUAGE OverloadedStrings #-}

module CLI.Download where

import CLI.AppEnv (defaultConfigRoot)
import CLI.GitHub
import CLI.Installer (unpackRuntimes, unpackTests)
import CLI.Runtime (Runtime (rtUI))
import CLI.UI
import Control.Exception (SomeException, finally, try)
import Data.Text qualified as T

data DownloadTarget = All | Runtimes | Tests
  deriving (Eq, Show)

newtype DownloadOpts = DownloadOpts
  { downloadTarget :: DownloadTarget
  }

parseTarget :: String -> Either String DownloadTarget
parseTarget "all" = Right All
parseTarget "runtimes" = Right Runtimes
parseTarget "tests" = Right Tests
parseTarget other = Left ("Invalid download target: '" ++ other ++ "' (expected: all, runtimes, tests)")

run :: Runtime -> DownloadOpts -> IO Int
run runtime opts = do
  let ui = rtUI runtime
  result <- try $ do
    checklist <- case uiMode ui of
      Rich ->
        startChecklist
          ui
          "Downloading"
          [ ChecklistStep StepActive "Fetching repository archive",
            ChecklistStep StepPending "Writing into data directory"
          ]
      Plain -> pure Nothing
    flip finally (stopMaybeChecklist checklist) $ do
      case uiMode ui of
        Rich -> pure ()
        Plain -> putPlain "download" "" "fetching repository archive"
      repo <- downloadRepoArchive
      case uiMode ui of
        Rich -> case checklist of
          Just cl -> do
            updateChecklistStep cl 0 StepDone "Fetching repository archive"
            updateChecklistStep cl 1 StepActive "Writing into data directory"
          Nothing -> pure ()
        Plain -> putPlain "download" "" "extracting"
      case downloadTarget opts of
        All -> do
          unpackRuntimes repo
          unpackTests repo
        Runtimes -> unpackRuntimes repo
        Tests -> unpackTests repo
      case uiMode ui of
        Rich -> do
          case checklist of
            Just cl -> updateChecklistStep cl 1 StepDone "Writing into data directory"
            Nothing -> pure ()
          root <- defaultConfigRoot
          case downloadTarget opts of
            All -> putSuccess ui "Runtimes and tests updated."
            Runtimes -> putSuccess ui "Runtimes updated."
            Tests -> putSuccess ui "Tests updated."
          putDim ui ("Data directory: " <> T.pack root)
        Plain ->
          putPlain "download" "" $
            "done: " <> case downloadTarget opts of
              All -> "runtimes and tests"
              Runtimes -> "runtimes"
              Tests -> "tests"
  case result of
    Right _ -> pure (renderExitCode ExitOk)
    Left exc -> do
      let reason = classifyException (exc :: SomeException)
      case uiMode ui of
        Rich -> do
          putErrorLine ui ("Download failed: " <> reason)
          putDim ui "Check your network connection and try again."
        Plain -> do
          putPlain "download" "error" reason
          putPlain "download" "" "Check your network connection and try again."
      pure (renderExitCode ExitInfra)
