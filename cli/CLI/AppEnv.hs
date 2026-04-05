{-# LANGUAGE OverloadedStrings #-}

module CLI.AppEnv where

import Data.Aeson
import Data.Text (pack)
import Data.Yaml (decodeFileEither, encodeFile)
import System.Directory (XdgDirectory (..), createDirectoryIfMissing, doesFileExist, getXdgDirectory)

data BackendType = Piston

instance FromJSON BackendType where
  parseJSON = withText "BackendType" $ \t ->
    case t of
      "piston" -> pure Piston
      other -> fail $ "Unknown backend type: " ++ show other

instance ToJSON BackendType where
  toJSON Piston = toJSON (pack "piston")

data Config = Config
  { backendType :: BackendType,
    backendUrl :: String
  }

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

loadConfig :: IO Config
loadConfig = do
  configRoot <- defaultConfigRoot
  let configPath = configRoot ++ "/config.yml"
  confExist <- doesFileExist configPath
  if confExist
    then do
      result <- decodeFileEither configPath
      case result of
        Left err -> do
          putStrLn $ "Error parsing config: " ++ show err
          return defaultConfig
        Right config -> return config
    else
      return defaultConfig

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
