module CLI.Commands where

import CLI.Config
import CLI.Download
import Options.Applicative

data Command
  = Download DownloadOpts
  | Config ConfigOpts

commandParser :: Parser Command
commandParser =
  subparser
    ( command "download" (info (Download <$> downloadOptsParser) (progDesc "Download tests/runtimes from GitHub repository"))
        <> command "config" (info (Config <$> configOptsParser) (progDesc "Manage config"))
    )

downloadOptsParser :: Parser DownloadOpts
downloadOptsParser =
  DownloadOpts
    <$> argument
      (eitherReader parseTarget)
      (help "runtimes | tests")

configOptsParser :: Parser ConfigOpts
configOptsParser =
  subparser
    ( command "set" (info (ConfigSet <$> configSetOptsParser) (progDesc "Set config value"))
        <> command "list" (info (pure ConfigList) (progDesc "List all config"))
    )

configSetOptsParser :: Parser ConfigSetOpts
configSetOptsParser =
  ConfigSetOpts
    <$> strArgument (metavar "KEY" <> help "Config key (backend.type, backend.url)")
    <*> strArgument (metavar "VALUE" <> help "Value for the key")
