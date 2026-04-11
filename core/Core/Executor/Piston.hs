{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Core.Executor.Piston where

import Core.Executor.Class qualified as E
import Core.Types
import Data.Aeson
import Data.Aeson.Types (typeMismatch)
import Data.Map as M
import Data.Text qualified as T
import GHC.Generics
import Network.HTTP.Req

newtype PistonExecutor = PistonExecutor {url :: String}

data PistonRuntime = PistonRuntime
  { lang :: Language,
    version :: String
  }
  deriving (Show, Generic)

data PistonExecuteRequest = PistonExecuteRequest
  { pistonRequestLanguage :: Language,
    pistonRequestVersion :: String,
    pistonRequestContent :: String,
    pistonRequestRunTimeout :: Maybe Int,
    pistonRequestRunMemoryLimit :: Maybe Int
  }
  deriving (Show, Generic)

data PistonExecuteRunStatus = OK | TLE | RE | Unknown String deriving (Show, Generic)

data PistonExecuteRun = PistonExecuteRun
  { pistonResponseStdout :: String,
    pistonResponseStderr :: String,
    pistonResponseStatus :: PistonExecuteRunStatus
  }
  deriving (Show, Generic)

newtype PistonExecuteResponse = PistonExecuteResponse
  { pistonResponseRun :: Maybe PistonExecuteRun
  }
  deriving (Show, Generic)

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

instance E.CodeExecutor PistonExecutor where
  execute piston request = do
    runtimes <- getRuntimes (url piston)
    case M.lookup (E.language request) runtimes of
      Just v -> do
        let pistonReq =
              PistonExecuteRequest
                { pistonRequestLanguage = E.language request,
                  pistonRequestVersion = v,
                  pistonRequestContent = E.content request,
                  pistonRequestRunTimeout = E.runTimeout request,
                  pistonRequestRunMemoryLimit = E.runMemoryLimit request
                }
        res <- executeReq (url piston) pistonReq
        return $
          case pistonResponseRun res of
            Just run ->
              if Prelude.null (pistonResponseStderr run)
                then case pistonResponseStatus run of
                  OK -> E.ExecSuc {E.stdout = pistonResponseStdout run}
                  TLE -> E.ExecFail {E.status = E.TLE, E.stderr = pistonResponseStderr run}
                  RE -> E.ExecFail {E.status = E.RE, E.stderr = pistonResponseStderr run}
                  Unknown m -> E.ExecFail {E.status = E.Unknown m, E.stderr = pistonResponseStderr run}
                else E.ExecFail {E.status = E.RE, E.stderr = pistonResponseStderr run}
            Nothing -> error "Piston response does not contain run field"
      Nothing -> fail ("There is no " ++ show (E.language request) ++ " language")

instance FromJSON PistonExecuteResponse where
  parseJSON = withObject "PistonExecuteResponse" $ \v ->
    PistonExecuteResponse
      <$> v .: "run"

instance FromJSON PistonExecuteRun where
  parseJSON = withObject "PistonExecuteRun" $ \v ->
    PistonExecuteRun
      <$> v .: "stdout"
      <*> v .: "stderr"
      <*> v .: "status"

instance FromJSON PistonRuntime

instance FromJSON PistonExecuteRunStatus where
  parseJSON Null = pure OK
  parseJSON (String s) = pure $ case s of
    "TO" -> TLE
    "RE" -> RE
    other -> Unknown (T.unpack other)
  parseJSON invalid = typeMismatch "PistonExecuteRunStatus" invalid

instance ToJSON PistonExecuteRequest where
  toJSON req =
    object
      [ "language" .= pistonRequestLanguage req,
        "version" .= pistonRequestVersion req,
        "content" .= pistonRequestContent req,
        "run_timeout" .= pistonRequestRunTimeout req,
        "run_memory_limit" .= pistonRequestRunMemoryLimit req
      ]
