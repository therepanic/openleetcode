module CLI.Config where

import CLI.AppEnv

data ConfigOpts
  = ConfigSet ConfigSetOpts
  | ConfigList

data ConfigSetOpts = ConfigSetOpts
  { configKey :: String,
    configValue :: String
  }

run :: ConfigOpts -> IO ()
run ConfigList = do
  config <- loadConfig
  putStrLn $ show config
run (ConfigSet opts) = do
  config <- loadConfig
  case configKey opts of
    "backend.type" -> case reads (configValue opts) of
      [(bt, "")] -> saveConfig config {backendType = bt}
      _ -> putStrLn $ "Unknown backend type: " ++ configValue opts
    "backend.url" -> saveConfig Config {backendUrl = configValue opts, backendType = backendType config}
    k -> putStrLn $ "Unknown config key: " ++ k
