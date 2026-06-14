{-# LANGUAGE CPP #-}

module Main where

import CLI.Commands
import CLI.Config qualified as Config
import CLI.Download qualified as Download
import CLI.Onboarding (OnboardingResult (OnboardingExit, OnboardingHandled), runOnboarding)
import CLI.Runtime (Runtime, mkRuntime)
import CLI.Submit qualified as Submit
import CLI.Update qualified as Update
import Control.Exception (SomeException, try)
import Data.Version (showVersion)
import GHC.IO.Encoding (utf8)
import Options.Applicative
import Options.Applicative.Help.Pretty (Doc, pretty, vsep)
import Paths_openleetcode qualified
import System.Exit (ExitCode (ExitFailure, ExitSuccess), exitWith)
import System.IO (hSetEncoding, stderr, stdout)
#if defined(mingw32_HOST_OS)
import System.Win32.Console (setConsoleOutputCP)
#endif

main :: IO ()
main = do
  initConsoleEncoding
  opts <-
    customExecParser (prefs showHelpOnEmpty) $
      info
        (cliOptionsParser <**> helper <**> versionOption)
        ( fullDesc
            <> progDesc "Run LeetCode tests locally using open test suites and a pluggable execution backend."
            <> header "openleetcode"
            <> footerDoc (Just cliHelpFooter)
        )
  runtime <- mkRuntime (cliGlobalOptions opts)
  onboardingResult <- runOnboarding runtime
  case onboardingResult of
    OnboardingExit code -> exitWith (ExitFailure code)
    OnboardingHandled
      | shouldSkipCommandAfterOnboarding (cliCommand opts) -> exitWith ExitSuccess
    _ -> do
      code <- dispatch runtime (cliCommand opts)
      exitWith $
        if code == 0
          then ExitSuccess
          else ExitFailure code

dispatch :: Runtime -> Command -> IO Int
dispatch runtime (Download opts) = Download.run runtime opts
dispatch runtime (Config opts) = Config.run runtime opts
dispatch runtime (Submit opts) = Submit.run runtime opts
dispatch runtime Update = Update.run runtime

versionOption :: Parser (a -> a)
versionOption =
  infoOption
    ("openleetcode " ++ showVersion Paths_openleetcode.version)
    (long "version" <> help "Show version and exit.")

cliHelpFooter :: Doc
cliHelpFooter =
  vsep
    [ pretty ("Getting started:" :: String),
      pretty ("  Data is stored under your XDG configuration directory (see `openleetcode` output on first run)." :: String),
      pretty ("" :: String),
      pretty ("Examples:" :: String),
      pretty ("  openleetcode submit ./solution.py --id 1" :: String),
      pretty ("  openleetcode download all" :: String),
      pretty ("  openleetcode config list" :: String),
      pretty ("  openleetcode update" :: String)
    ]

initConsoleEncoding :: IO ()
initConsoleEncoding = do
  setupWindowsCP
  _ <- try (hSetEncoding stdout utf8) :: IO (Either SomeException ())
  _ <- try (hSetEncoding stderr utf8) :: IO (Either SomeException ())
  pure ()

shouldSkipCommandAfterOnboarding :: Command -> Bool
shouldSkipCommandAfterOnboarding (Download _) = True
shouldSkipCommandAfterOnboarding _ = False

setupWindowsCP :: IO ()
#if defined(mingw32_HOST_OS)
setupWindowsCP = do
  _ <- try (setConsoleOutputCP 65001) :: IO (Either SomeException ())
  pure ()
#else
setupWindowsCP = pure ()
#endif
