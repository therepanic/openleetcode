module CLI.Commands where

import CLI.Config
import CLI.Download
import CLI.Submit (SubmitOpts (SubmitOpts))
import CLI.UI (ColorMode (ColorAuto), GlobalOptions (GlobalOptions))
import Core.Types (convertStrToLang)
import Options.Applicative
import Options.Applicative.Help.Pretty (pretty, vsep)

data Command
  = Download DownloadOpts
  | Config ConfigOpts
  | Submit SubmitOpts

data CliOptions = CliOptions
  { cliGlobalOptions :: GlobalOptions,
    cliCommand :: Command
  }

cliOptionsParser :: Parser CliOptions
cliOptionsParser =
  CliOptions
    <$> globalOptionsParser
    <*> commandParser

globalOptionsParser :: Parser GlobalOptions
globalOptionsParser =
  GlobalOptions
    <$> switch (long "plain" <> help "Disable animations and colors, line-oriented output.")
    <*> switch (long "no-color" <> help "Disable ANSI colors.")
    <*> pure ColorAuto

commandParser :: Parser Command
commandParser =
  subparser
    ( command "submit" (info ((Submit <$> submitOptsParser) <**> helper) submitHelp)
        <> command "download" (info ((Download <$> downloadOptsParser) <**> helper) downloadHelp)
        <> command "config" (info ((Config <$> configOptsParser) <**> helper) configHelp)
    )

downloadOptsParser :: Parser DownloadOpts
downloadOptsParser =
  DownloadOpts
    <$> argument
      (eitherReader parseTarget)
      (metavar "runtimes|tests" <> help "Download target")

configOptsParser :: Parser ConfigOpts
configOptsParser =
  subparser
    ( command "set" (info ((ConfigSet <$> configSetOptsParser) <**> helper) configSetHelp)
        <> command "list" (info (pure ConfigList <**> helper) (progDesc "List all config"))
    )

configSetOptsParser :: Parser ConfigSetOpts
configSetOptsParser =
  ConfigSetOpts
    <$> strArgument (metavar "KEY" <> help "Config key (backend.type, backend.url)")
    <*> strArgument (metavar "VALUE" <> help "Value for the key")

submitOptsParser :: Parser SubmitOpts
submitOptsParser =
  SubmitOpts
    <$> strArgument
      (metavar "PATH" <> help "Path to solution file")
    <*> optional
      ( option
          auto
          (long "id" <> metavar "INT" <> help "Problem ID (takes precedence over --title when both are provided)")
      )
    <*> optional
      ( strOption
          (long "title" <> metavar "STR" <> help "Problem title substring")
      )
    <*> optional
      ( option
          (maybeReader convertStrToLang)
          (long "lang" <> metavar "LANG" <> help "Language override (for example: python3, cpp, rust)")
      )

submitHelp :: InfoMod Command
submitHelp =
  progDesc "Run a solution against a local openleetcode test suite"
    <> footerDoc
      ( Just $
          vsep
            [ pretty ("Provide either --id <number> or --title <substring>." :: String),
              pretty ("If both are provided, --id takes precedence." :: String),
              pretty ("" :: String),
              pretty ("Example:" :: String),
              pretty ("  openleetcode submit ./solution.py --id 1" :: String)
            ]
      )

downloadHelp :: InfoMod Command
downloadHelp =
  progDesc "Download tests or runtimes into the data directory"
    <> footerDoc
      ( Just $
          vsep
            [ pretty ("Targets:" :: String),
              pretty ("  runtimes" :: String),
              pretty ("  tests" :: String)
            ]
      )

configHelp :: InfoMod Command
configHelp = progDesc "Manage config"

configSetHelp :: InfoMod ConfigOpts
configSetHelp =
  progDesc "Set config value"
    <> footerDoc
      ( Just $
          vsep
            [ pretty ("Allowed keys:" :: String),
              pretty ("  backend.type" :: String),
              pretty ("  backend.url" :: String)
            ]
      )
