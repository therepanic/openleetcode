module CLI.Config where

import CLI.AppEnv
import CLI.Runtime (Runtime (rtUI))
import CLI.UI
import Control.Exception (SomeException, try)

data ConfigOpts
  = ConfigSet ConfigSetOpts
  | ConfigList

data ConfigSetOpts = ConfigSetOpts
  { configKey :: String,
    configValue :: String
  }

run :: Runtime -> ConfigOpts -> IO Int
run runtime ConfigList = do
  let ui = rtUI runtime
  result <- loadConfigDetailed
  emitConfigWarning ui result
  configPath <- loadConfigPath
  let config = clrConfig result
  putStrLn "Backend"
  putStrLn $ "  type    " ++ show (backendType config)
  putStrLn $ "  url     " ++ backendUrl config
  putStrLn $ "Config file: " ++ configPath
  pure (renderExitCode ExitOk)
run runtime (ConfigSet opts) = do
  let ui = rtUI runtime
  result <- loadConfigDetailed
  emitConfigWarning ui result
  let config = clrConfig result
  case configKey opts of
    "backend.type" -> case reads (configValue opts) of
      [(bt, "")] -> do
        saveResult <- try (saveConfig config {backendType = bt}) :: IO (Either SomeException ())
        case saveResult of
          Right _ -> do
            emitConfigSuccess ui "backend.type set to" (configValue opts)
            pure (renderExitCode ExitOk)
          Left exc -> do
            emitConfigWriteError ui exc
            pure (renderExitCode ExitInfra)
      _ -> do
        emitConfigError ui ("Unknown backend type: '" ++ configValue opts ++ "'")
        case uiMode ui of
          Rich -> putStrLn "Allowed values: piston"
          Plain -> putPlain "config" "" "Allowed values: piston"
        pure (renderExitCode ExitInput)
    "backend.url" -> do
      saveResult <- try (saveConfig Config {backendUrl = configValue opts, backendType = backendType config}) :: IO (Either SomeException ())
      case saveResult of
        Right _ -> do
          case uiMode ui of
            Rich -> putSuccess ui "backend.url updated"
            Plain -> putPlain "config" "" "backend.url updated"
          pure (renderExitCode ExitOk)
        Left exc -> do
          emitConfigWriteError ui exc
          pure (renderExitCode ExitInfra)
    k -> do
      emitConfigError ui ("Unknown config key: '" ++ k ++ "'")
      case uiMode ui of
        Rich -> putStrLn "Try: backend.type, backend.url"
        Plain -> putPlain "config" "" "Try: backend.type, backend.url"
      pure (renderExitCode ExitInput)

emitConfigSuccess :: UI -> String -> String -> IO ()
emitConfigSuccess ui prefix value = case uiMode ui of
  Rich -> putSuccess ui (prefix ++ " " ++ value)
  Plain -> putPlain "config" "" (prefix ++ " " ++ value)

emitConfigError :: UI -> String -> IO ()
emitConfigError ui msg = case uiMode ui of
  Rich -> putErrorLine ui msg
  Plain -> putPlain "config" "error" msg

emitConfigWarning :: UI -> ConfigLoadResult -> IO ()
emitConfigWarning ui result = case clrWarning result of
  Nothing -> pure ()
  Just warn ->
    case uiMode ui of
      Rich -> do
        putStrLn "Warning: could not parse config file; using defaults."
        putStrLn ("Details: " ++ sanitizeSingleLine warn)
      Plain -> do
        putPlain "config" "warning" "could not parse config file; using defaults."
        putPlain "config" "warning" ("Details: " ++ sanitizeSingleLine warn)

emitConfigWriteError :: UI -> SomeException -> IO ()
emitConfigWriteError ui exc =
  case uiMode ui of
    Rich -> putErrorLine ui ("Could not write config file: " ++ classifyException exc)
    Plain -> putPlain "config" "error" ("could not write config file: " ++ classifyException exc)
