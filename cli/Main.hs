module Main where

import CLI.Commands
import Options.Applicative

main :: IO ()
main = do
  cmd <-
    execParser $
      info
        (commandParser <**> helper)
        (fullDesc <> progDesc "we have democratized the Leetcode tests" <> header "openleetcode")
  dispatch cmd

dispatch :: Command -> IO ()
