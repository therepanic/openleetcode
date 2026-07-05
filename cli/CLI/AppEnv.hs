{-# LANGUAGE OverloadedStrings #-}

module CLI.AppEnv where

import Core.Types
import Data.Aeson
import Data.Maybe (fromMaybe)
import Data.Text (Text)
import Data.Text qualified as T
import Data.Yaml (decodeFileEither, encodeFile)
import System.Directory (XdgDirectory (..), createDirectoryIfMissing, doesFileExist, getXdgDirectory)
import System.Environment (lookupEnv)

data Config = Config
  { backendType :: ExecutorType,
    backendUrl :: Text
  }
  deriving (Show)

data ConfigLoadResult = ConfigLoadResult
  { clrConfig :: Config,
    clrWarning :: Maybe Text
  }

loadConfig :: IO ConfigLoadResult
loadConfig = do
  configRoot <- defaultConfigRoot
  let configPath = configRoot ++ "/config.yml"
  confExist <- doesFileExist configPath
  if confExist
    then do
      result <- decodeFileEither configPath
      config <- defaultConfig
      case result of
        Left err ->
          pure
            ConfigLoadResult
              { clrConfig = config,
                clrWarning = Just (T.pack (show err))
              }
        Right config ->
          pure
            ConfigLoadResult
              { clrConfig = config,
                clrWarning = Nothing
              }
    else do
      config <- defaultConfig
      saveConfig config
      pure
        ConfigLoadResult
          { clrConfig = config,
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

defaultConfig :: IO Config
defaultConfig = do
  envUrl <- lookupEnv "OPENLEETCODE_BACKEND_URL"
  let url = fromMaybe defaultBackendUrl (T.pack <$> envUrl)
  pure
    Config
      { backendType = Piston,
        backendUrl = url
      }

defaultBackendUrl :: Text
defaultBackendUrl = "http://localhost:2000"

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
