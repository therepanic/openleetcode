{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Core.Executor.Piston where

import Core.Executor.Class
import Core.Types
import Data.Aeson
import Data.Map as M
import Data.Text qualified as T
import GHC.Generics
import Network.HTTP.Req

data PistonExecutor = PistonExecutor
  { url :: String
  }

data PistonRuntime = PistonRuntime
  { lang :: Language,
    version :: String
  }
  deriving (Show, Generic)

instance FromJSON PistonRuntime

data PistonExecuteRequest = PistonExecuteRequest
  { pistonRequestLanguage :: Language,
    pistonRequestVersion :: String,
    pistonRequestContent :: String,
    pistonRequestRunTimeout :: Int,
    pistonRequestRunMemoryLimit :: Int
  }
  deriving (Show, Generic)

instance ToJSON PistonExecuteRequest where
  toJSON req =
    object
      [ "language" .= pistonRequestLanguage req,
        "version" .= pistonRequestVersion req,
        "content" .= pistonRequestContent req,
        "run_timeout" .= pistonRequestRunTimeout req,
        "run_memory_limit" .= pistonRequestRunMemoryLimit req
      ]

data PistonExecuteRun = PistonExecuteRun
  { pistonResponseStdout :: String,
    pistonResponseStderr :: String
  }
  deriving (Show, Generic)

instance FromJSON PistonExecuteRun where
  parseJSON = withObject "PistonExecuteRun" $ \v ->
    PistonExecuteRun
      <$> v .: "stdout"
      <*> v .: "stderr"

data PistonExecuteResponse = PistonExecuteResponse
  { pistonResponseRun :: Maybe PistonExecuteRun
  }
  deriving (Show, Generic)

instance FromJSON PistonExecuteResponse where
  parseJSON = withObject "PistonExecuteResponse" $ \v ->
    PistonExecuteResponse
      <$> v .: "run"

getRuntimes :: String -> IO (M.Map Language String)
getRuntimes url = runReq defaultHttpConfig $ do
  r <-
    req
      GET
      (https (T.pack url) /: "runtimes")
      NoReqBody
      jsonResponse
      mempty
  let runtimes = responseBody r :: [PistonRuntime]
  let fill :: [PistonRuntime] -> M.Map Language String -> M.Map Language String
      fill [] m = m
      fill (x : xs) m = fill xs (M.insert (lang x) (version x) m)
  return (fill runtimes M.empty)

executeReq :: String -> PistonExecuteRequest -> IO PistonExecuteResponse
executeReq url piston = runReq defaultHttpConfig $ do
  r <-
    req
      POST
      (https (T.pack url) /: "execute")
      (ReqBodyJson piston)
      jsonResponse
      mempty
  let response = responseBody r :: PistonExecuteResponse
  return response

instance CodeExecutor PistonExecutor where
  execute piston request = do
    runtimes <- getRuntimes (url piston)
    case M.lookup (language request) runtimes of
      Just v -> do
        let pistonReq =
              PistonExecuteRequest
                { pistonRequestLanguage = language request,
                  pistonRequestVersion = v,
                  pistonRequestContent = content request,
                  pistonRequestRunTimeout = runTimeout request,
                  pistonRequestRunMemoryLimit = runMemoryLimit request
                }
        res <- executeReq (url piston) pistonReq
        return $
          case pistonResponseRun res of
            Just run ->
              if Prelude.null (pistonResponseStderr run)
                then ExecSuc {stdout = pistonResponseStdout run}
                else ExecFail {stderr = pistonResponseStderr run}
            Nothing -> error "Piston response does not contain run field"
      Nothing -> fail ("There is no " ++ show (language request) ++ " language")
