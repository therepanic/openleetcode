module CLI.Onboarding where

import CLI.AppEnv
import CLI.GitHub
import CLI.Installer (unpackRuntimes, unpackTests)
import Control.Monad (unless)
import System.Directory
import System.IO (hFlush, stdout)

runOnboarding :: IO ()
runOnboarding = do
  root <- defaultConfigRoot
  exist <- doesDirectoryExist root
  createDirectoryIfMissing False root
  unless exist $ do
    putStrLn "Download tests and runtimes now? [Y/n]"
    hFlush stdout
    answer <- getLine
    case answer of
      "n" -> return ()
      _ -> do
        putStrLn "Installing..."
        repository <- downloadRepoArchive
        unpackRuntimes repository
        unpackTests repository
        putStrLn "Runtimes and tests were successfully installed"
