module Main where

import CLI.Commands
import CLI.Config qualified as Config
import CLI.Download qualified as Download
import CLI.Onboarding (runOnboarding)
import Options.Applicative

main :: IO ()
main = do
  runOnboarding
  cmd <-
    customExecParser (prefs showHelpOnEmpty) $
      info
        (commandParser <**> helper)
        (fullDesc <> progDesc "we have democratized the Leetcode tests" <> header "openleetcode")
  dispatch cmd

dispatch :: Command -> IO ()
dispatch (Download opts) = Download.run opts
dispatch (Config opts) = Config.run opts
