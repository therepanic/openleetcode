{-# LANGUAGE OverloadedStrings #-}

module CLI.Onboarding where

import CLI.AppEnv
import CLI.GitHub
import CLI.Installer (unpackRuntimes, unpackTests)
import CLI.Runtime (Runtime (rtUI))
import CLI.UI
import Control.Exception (SomeException, finally, try)
import Data.Char (toLower)
import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import System.Directory
import System.IO (hFlush, stdout)

data OnboardingResult
  = OnboardingContinue
  | OnboardingExit Int
  | OnboardingHandled

runOnboarding :: Runtime -> IO OnboardingResult
runOnboarding runtime = do
  let ui = rtUI runtime
  root <- defaultConfigRoot
  exist <- doesDirectoryExist root
  createDirectoryIfMissing False root
  if exist
    then pure OnboardingContinue
    else do
      emitWelcome ui root
      interactive <- stdinIsInteractive
      if not interactive
        then do
          putPlain "onboarding" "" "non-interactive stdin, skipping automatic download (run `openleetcode download all`)"
          pure OnboardingContinue
        else do
          TIO.putStr (renderPrompt ui "Download them now? [Y/n] ")
          hFlush stdout
          answer <- getLine
          if isSkip answer
            then do
              emitSkip ui
              pure OnboardingHandled
            else do
              result <- try (installAll ui) :: IO (Either SomeException ())
              case result of
                Right _ -> pure OnboardingHandled
                Left exc -> do
                  let reason = classifyException exc
                  case uiMode ui of
                    Rich -> putErrorLine ui ("Setup failed: " <> reason)
                    Plain -> putPlain "onboarding" "error" ("setup failed: " <> reason)
                  pure (OnboardingExit (renderExitCode ExitInfra))

emitWelcome :: UI -> FilePath -> IO ()
emitWelcome ui root = case uiMode ui of
  Rich -> do
    mapM_ (TIO.putStrLn . renderOnboardingBannerLine ui) (T.lines onboardingBanner)
    TIO.putStrLn (style ui OrangeBold "Welcome to openleetcode.")
    TIO.putStrLn (style ui Dim ("Data directory: " <> T.pack root))
    TIO.putStrLn (style ui Yellow "Tests and runtimes are not installed yet")
  Plain -> do
    putPlain "onboarding" "" "welcome"
    putPlain "onboarding" "" ("data directory: " <> T.pack root)
    putPlain "onboarding" "" "tests and runtimes not installed"

emitSkip :: UI -> IO ()
emitSkip ui = case uiMode ui of
  Rich -> do
    TIO.putStrLn (style ui Yellow "Skipping download")
    TIO.putStrLn (style ui Dim "You can install later with:")
    TIO.putStrLn (style ui Dim "  openleetcode download all")
  Plain -> do
    putPlain "onboarding" "" "download skipped"
    putPlain "onboarding" "hint" "openleetcode download runtimes|tests"

installAll :: UI -> IO ()
installAll ui = do
  checklist <- case uiMode ui of
    Rich ->
      startChecklist
        ui
        "Installing…"
        [ ChecklistStep StepActive "Downloading repository archive",
          ChecklistStep StepPending "Verifying archive",
          ChecklistStep StepPending "Extracting runtimes",
          ChecklistStep StepPending "Extracting tests"
        ]
    Plain -> pure Nothing
  flip finally (stopMaybeChecklist checklist) $ do
    case uiMode ui of
      Rich -> pure ()
      Plain -> putPlain "onboarding" "installing" "downloading archive"
    repo <- downloadRepoArchive
    case uiMode ui of
      Rich -> case checklist of
        Just cl -> do
          updateChecklistStep cl 0 StepDone "Downloading repository archive"
          updateChecklistStep cl 1 StepDone "Verifying archive"
          updateChecklistStep cl 2 StepActive "Extracting runtimes"
        Nothing -> pure ()
      Plain -> do
        putPlain "onboarding" "installing" "verifying archive"
        putPlain "onboarding" "installing" "extracting runtimes"
    unpackRuntimes repo
    case uiMode ui of
      Rich -> case checklist of
        Just cl -> do
          updateChecklistStep cl 2 StepDone "Extracting runtimes"
          updateChecklistStep cl 3 StepActive "Extracting tests"
        Nothing -> pure ()
      Plain -> putPlain "onboarding" "installing" "extracting tests"
    unpackTests repo
    case uiMode ui of
      Rich -> do
        case checklist of
          Just cl -> updateChecklistStep cl 3 StepDone "Extracting tests"
          Nothing -> pure ()
        putSuccess ui "openleetcode is ready"
        putDim ui "Tip: run `openleetcode --help` or `openleetcode submit <file> --id <id>`"
      Plain -> do
        putPlain "onboarding" "installing" "done"
        putPlain "onboarding" "tip" "run `openleetcode --help`"

isSkip :: String -> Bool
isSkip raw =
  case map toLower (trim raw) of
    "n" -> True
    _ -> False

trim :: String -> String
trim = reverse . dropWhile (== ' ') . reverse . dropWhile (== ' ')

renderPrompt :: UI -> T.Text -> T.Text
renderPrompt ui prompt =
  case uiMode ui of
    Rich -> style ui Yellow prompt
    Plain -> prompt

renderOnboardingBannerLine :: UI -> T.Text -> T.Text
renderOnboardingBannerLine ui line =
  case T.splitOn "#" line of
    [open, leet, code] ->
      style ui Gray open <> style ui OrangeBold leet <> style ui Gray code
    _ -> style ui Gray line

onboardingBanner :: T.Text
onboardingBanner =
  T.unlines
    [ " ▄▄▄  ▄▄▄▄  ▄▄▄▄▄ ▄▄  ▄▄ #▄▄    ▄▄▄▄▄ ▄▄▄▄▄ ▄▄▄▄▄▄ #▄▄▄▄  ▄▄▄  ▄▄▄▄  ▄▄▄▄▄",
      "██▀██ ██▄█▀ ██▄▄  ███▄██ #██    ██▄▄  ██▄▄    ██  #██▀▀▀ ██▀██ ██▀██ ██▄▄",
      "▀███▀ ██    ██▄▄▄ ██ ▀██ #██▄▄▄ ██▄▄▄ ██▄▄▄   ██  #▀████ ▀███▀ ████▀ ██▄▄▄"
    ]
