{-# LANGUAGE OverloadedStrings #-}

module CLI.AppEnv where

import Core.Types
import Data.Aeson
import Data.Yaml (decodeFileEither, encodeFile)
import System.Directory (XdgDirectory (..), createDirectoryIfMissing, doesFileExist, getXdgDirectory)

data Config = Config
  { backendType :: ExecutorType,
    backendUrl :: String
  }
  deriving (Show)

data ConfigLoadResult = ConfigLoadResult
  { clrConfig :: Config,
    clrWarning :: Maybe String
  }

loadConfig :: IO ConfigLoadResult
loadConfig = do
  configRoot <- defaultConfigRoot
  let configPath = configRoot ++ "/config.yml"
  confExist <- doesFileExist configPath
  if confExist
    then do
      result <- decodeFileEither configPath
      case result of
        Left err ->
          pure
            ConfigLoadResult
              { clrConfig = defaultConfig,
                clrWarning = Just (show err)
              }
        Right config ->
          pure
            ConfigLoadResult
              { clrConfig = config,
                clrWarning = Nothing
              }
    else do
      saveConfig defaultConfig
      pure
        ConfigLoadResult
          { clrConfig = defaultConfig,
            clrWarning = Nothing
          }

loadConfigPath :: IO FilePath
loadConfigPath = do
  configRoot <- defaultConfigRoot
  pure (configRoot <> "/config.yml")

saveConfig :: Config -> IO ()
saveConfig conf = do
  configRoot <- defaultConfigRoot
  createDirectoryIfMissing True configRoot
  Data.Yaml.encodeFile (configRoot <> "/config.yml") conf

defaultConfig :: Config
defaultConfig =
  Config
    { backendType = Piston,
      backendUrl = "http://localhost:2000"
    }

defaultConfigRoot :: IO FilePath
defaultConfigRoot = getXdgDirectory XdgConfig "openleetcode"

instance FromJSON Config where
  parseJSON = withObject "Config" $ \o ->
    Config
      <$> (o .: "backendType")
      <*> (o .: "backendUrl")

instance ToJSON Config where
  toJSON (Config backendType backendUrl) =
    object
      [ "backendType" .= backendType,
        "backendUrl" .= backendUrl
      ]
