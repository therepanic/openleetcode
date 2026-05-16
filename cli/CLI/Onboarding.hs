module CLI.Onboarding where

import CLI.AppEnv
import CLI.GitHub
import CLI.Installer (unpackRuntimes, unpackTests)
import CLI.Runtime (Runtime (rtUI))
import CLI.UI
import Control.Exception (SomeException, finally, try)
import Data.Char (toLower)
import System.Directory
import System.IO (hFlush, stdout)

runOnboarding :: Runtime -> IO Int
runOnboarding runtime = do
  let ui = rtUI runtime
  root <- defaultConfigRoot
  exist <- doesDirectoryExist root
  createDirectoryIfMissing False root
  if exist
    then pure (renderExitCode ExitOk)
    else do
      emitWelcome ui root
      interactive <- stdinIsInteractive
      if not interactive
        then do
          putPlain "onboarding" "" "non-interactive stdin, skipping automatic download (run `openleetcode download tests` and `openleetcode download runtimes`)"
          pure (renderExitCode ExitOk)
        else do
          putStr (renderPrompt ui "Download them now? [Y/n] ")
          hFlush stdout
          answer <- getLine
          if isSkip answer
            then do
              emitSkip ui
              pure (renderExitCode ExitOk)
            else do
              result <- try (installAll ui) :: IO (Either SomeException ())
              case result of
                Right _ -> pure (renderExitCode ExitOk)
                Left exc -> do
                  let reason = classifyException exc
                  case uiMode ui of
                    Rich -> putErrorLine ui ("Setup failed: " ++ reason)
                    Plain -> putPlain "onboarding" "error" ("setup failed: " ++ reason)
                  pure (renderExitCode ExitInfra)

emitWelcome :: UI -> FilePath -> IO ()
emitWelcome ui root = case uiMode ui of
  Rich -> do
    putStrLn (style ui CyanBold onboardingBanner)
    putStrLn (style ui CyanBold "Welcome to openleetcode.")
    putStrLn (style ui Dim ("Data directory: " ++ root))
    putStrLn (style ui Yellow "Tests and runtimes are not installed yet.")
  Plain -> do
    putPlain "onboarding" "" "welcome"
    putPlain "onboarding" "" ("data directory: " ++ root)
    putPlain "onboarding" "" "tests and runtimes not installed"

emitSkip :: UI -> IO ()
emitSkip ui = case uiMode ui of
  Rich -> do
    putStrLn (style ui Yellow "Skipping download.")
    putStrLn (style ui Dim "You can install later with:")
    putStrLn (style ui Dim "  openleetcode download runtimes")
    putStrLn (style ui Dim "  openleetcode download tests")
  Plain -> do
    putPlain "onboarding" "" "download skipped"
    putPlain "onboarding" "hint" "openleetcode download runtimes|tests"

installAll :: UI -> IO ()
installAll ui = do
  checklist <- case uiMode ui of
    Rich ->
      startChecklist
        ui
        "Installing"
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
        putSuccess ui "openleetcode is ready."
        putDim ui "Tip: run `openleetcode --help` or `openleetcode submit <file> --id <id>`."
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

renderPrompt :: UI -> String -> String
renderPrompt ui prompt =
  case uiMode ui of
    Rich -> style ui Yellow prompt
    Plain -> prompt

onboardingBanner :: String
onboardingBanner =
  unlines
    [ "                          .__                 __                   .___      ",
      "  ____ ______   ____   ____ |  |   ____   _____/  |_  ____  ____   __| _/____  ",
      " /  _ \\\\____ \\_/ __ \\\\ /    \\|  | _/ __ \\\\_/ __ \\\\   __\\\\/ ___\\\\/  _ \\\\ / __ |/ __ \\ ",
      "(  <_> )  |_> >  ___/|   |  \\  |_\\  ___/\\  ___/|  | \\  \\__(  <_> ) /_/ \\  ___/ ",
      " \\____/|   __/ \\___  >___|  /____/\\___  >\\___  >__|  \\___  >____/\\____ |\\___  >",
      "       |__|        \\/     \\/          \\/     \\/          \\/           \\/    \\/ "
    ]

stopMaybeChecklist :: Maybe Checklist -> IO ()
stopMaybeChecklist Nothing = pure ()
stopMaybeChecklist (Just checklist) = stopChecklist checklist
