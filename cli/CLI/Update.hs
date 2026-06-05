{-# LANGUAGE CPP #-}
{-# LANGUAGE OverloadedStrings #-}

module CLI.Update where

import CLI.GitHub qualified as GitHub
import CLI.Runtime (Runtime)
import CLI.UI
import Data.ByteString.Lazy qualified as LBS
import System.Exit (ExitCode (ExitFailure, ExitSuccess))
import System.IO
import System.Process

run :: Runtime -> IO Int
run _ = do
  installer <- GitHub.downloadInstaller isWindows
  let cmd = if isWindows then proc "powershell" ["-Command", "-"] else proc "bash" ["-s"]
  (Just hin, _, _, ph) <- createProcess cmd {std_in = CreatePipe}
  LBS.hPut hin installer
  hClose hin
  exitCode <- waitForProcess ph
  pure $ case exitCode of
    ExitSuccess -> renderExitCode ExitOk
    ExitFailure _ -> renderExitCode ExitInfra

isWindows :: Bool
#ifdef mingw32_HOST_OS
isWindows = True
#else
isWindows = False
#endif
