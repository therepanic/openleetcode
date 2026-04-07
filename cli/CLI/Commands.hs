module CLI.Commands where

import CLI.Download
import Options.Applicative

data Command = Download DownloadOpts

commandParser :: Parser Command
commandParser =
  subparser
    (command "download" (info (Download <$> downloadOptsParser) (progDesc "Download tests/runtimes from GitHub repository")))

downloadOptsParser :: Parser DownloadOpts
downloadOptsParser =
  DownloadOpts
    <$> argument
      (eitherReader parseTarget)
      (help "runtimes | tests")
