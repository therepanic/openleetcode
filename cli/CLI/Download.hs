module CLI.Download where

import CLI.GitHub
import CLI.Installer (unpackRuntimes, unpackTests)

data DownloadTarget = Runtimes | Tests

data DownloadOpts = DownloadOpts
  { downloadTarget :: DownloadTarget
  }

parseTarget :: String -> Either String DownloadTarget
parseTarget "runtimes" = Right Runtimes
parseTarget "tests" = Right Tests
parseTarget other = Left ("Unknown command: " ++ other)

run :: DownloadOpts -> IO ()
run opts = case downloadTarget opts of
  Runtimes -> do
    repo <- downloadRepoArchive
    unpackRuntimes repo
    putStrLn "Runtimes downloaded"
  Tests -> do
    repo <- downloadRepoArchive
    unpackTests repo
    putStrLn "Tests downloaded"
