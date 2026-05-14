{-# LANGUAGE CPP #-}

module Main where

import CLI.Commands
import CLI.Runtime (Runtime, mkRuntime)
import CLI.Config qualified as Config
import CLI.Download qualified as Download
import CLI.Onboarding (runOnboarding)
import CLI.Submit qualified as Submit
import Control.Exception (SomeException, try)
import Data.List (find)
import Data.Version (showVersion)
import GHC.IO.Encoding (utf8)
import Options.Applicative
import Options.Applicative.Help.Pretty (Doc, pretty, vsep)
import Paths_openleetcode qualified
import System.Environment (getArgs, withArgs)
import System.Exit (exitWith, ExitCode (ExitFailure, ExitSuccess))
import System.Info (os)
import System.IO (hSetEncoding, stderr, stdout)
#if defined(mingw32_HOST_OS)
import System.Win32.Console (setConsoleOutputCP)
#endif

main :: IO ()
main = do
  initConsoleEncoding
  rawArgs <- getArgs
  withArgs (rewriteLegacyArgs rawArgs) $ do
    opts <-
      customExecParser (prefs showHelpOnEmpty) $
        info
          (cliOptionsParser <**> helper <**> versionOption)
          ( fullDesc
              <> progDesc "Run LeetCode-style tests locally using open test suites and a pluggable execution backend."
              <> header "openleetcode"
              <> footerDoc (Just cliHelpFooter)
          )
    runtime <- mkRuntime (cliGlobalOptions opts)
    onboardingCode <- runOnboarding runtime
    if onboardingCode /= 0
      then exitWith (ExitFailure onboardingCode)
      else do
        code <- dispatch runtime (cliCommand opts)
        exitWith $
          if code == 0
            then ExitSuccess
            else ExitFailure code

dispatch :: Runtime -> Command -> IO Int
dispatch runtime (Download opts) = Download.run runtime opts
dispatch runtime (Config opts) = Config.run runtime opts
dispatch runtime (Submit opts) = Submit.run runtime opts

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
      pretty ("  openleetcode download tests" :: String),
      pretty ("  openleetcode config list" :: String)
    ]

rewriteLegacyArgs :: [String] -> [String]
rewriteLegacyArgs args =
  case firstNonOption args of
    Just cmd | cmd `elem` ["submit", "download", "config"] -> args
    Just _ -> globalPrefix ++ rewriteLegacySubmitArgs remainder
    Nothing -> args
  where
    (globalPrefix, remainder) = splitLegacyGlobalPrefix args

firstNonOption :: [String] -> Maybe String
firstNonOption = find (not . isOptionLike)

isOptionLike :: String -> Bool
isOptionLike ('-' : _) = True
isOptionLike _ = False

splitLegacyGlobalPrefix :: [String] -> ([String], [String])
splitLegacyGlobalPrefix ("--plain" : rest) =
  let (prefix, remainder) = splitLegacyGlobalPrefix rest
   in ("--plain" : prefix, remainder)
splitLegacyGlobalPrefix ("--no-color" : rest) =
  let (prefix, remainder) = splitLegacyGlobalPrefix rest
   in ("--no-color" : prefix, remainder)
splitLegacyGlobalPrefix ("--version" : rest) =
  let (prefix, remainder) = splitLegacyGlobalPrefix rest
   in ("--version" : prefix, remainder)
splitLegacyGlobalPrefix ("-h" : rest) =
  let (prefix, remainder) = splitLegacyGlobalPrefix rest
   in ("-h" : prefix, remainder)
splitLegacyGlobalPrefix ("--help" : rest) =
  let (prefix, remainder) = splitLegacyGlobalPrefix rest
   in ("--help" : prefix, remainder)
splitLegacyGlobalPrefix args = ([], args)

rewriteLegacySubmitArgs :: [String] -> [String]
rewriteLegacySubmitArgs args =
  case break (not . isOptionLike) args of
    (submitOpts, path : rest) -> ["submit", path] ++ submitOpts ++ rest
    _ -> ["submit"] ++ args

initConsoleEncoding :: IO ()
initConsoleEncoding = do
#if defined(mingw32_HOST_OS)
  if os == "mingw32"
    then do
      _ <- try (setConsoleOutputCP 65001) :: IO (Either SomeException ())
      pure ()
    else pure ()
#endif
  _ <- try (hSetEncoding stdout utf8) :: IO (Either SomeException ())
  _ <- try (hSetEncoding stderr utf8) :: IO (Either SomeException ())
  pure ()
