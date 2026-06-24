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

newtype PistonExecutor = PistonExecutor {url :: T.Text}

data PistonRuntime = PistonRuntime
  { language :: Language,
    version :: T.Text
  }
  deriving (Show, Generic)

data PistonExecuteRequest = PistonExecuteRequest
  { pistonRequestLanguage :: Language,
    pistonRequestVersion :: T.Text,
    pistonRequestContent :: T.Text,
    pistonRequestFiles :: [E.ExecFile],
    pistonRequestRunTimeout :: Maybe Int,
    pistonRequestRunMemoryLimit :: Maybe Int
  }
  deriving (Show, Generic)

data PistonExecuteRunStatus = OK | TLE | RE | Unknown T.Text deriving (Show, Generic)

data PistonExecuteRun = PistonExecuteRun
  { pistonResponseStdout :: T.Text,
    pistonResponseStderr :: T.Text,
    pistonResponseStatus :: PistonExecuteRunStatus
  }
  deriving (Show, Generic)

newtype PistonExecuteResponse = PistonExecuteResponse
  { pistonResponseRun :: Maybe PistonExecuteRun
  }
  deriving (Show, Generic)

getRuntimes :: T.Text -> IO (M.Map Language T.Text)
getRuntimes url = runReq defaultHttpConfig $ do
  r <- withBaseUrl url $ \base opts ->
    req
      GET
      (base /: "api" /: "v2" /: "runtimes")
      NoReqBody
      jsonResponse
      opts
  let runtimes = responseBody r :: [PistonRuntime]
  return $ M.fromList [(language x, version x) | x <- runtimes]

executeReq :: T.Text -> PistonExecuteRequest -> IO PistonExecuteResponse
executeReq url piston = runReq defaultHttpConfig $ do
  r <- withBaseUrl url $ \base opts ->
    req
      POST
      (base /: "api" /: "v2" /: "execute")
      (ReqBodyJson piston)
      jsonResponse
      opts
  return (responseBody r)

withBaseUrl ::
  T.Text ->
  (forall scheme. Url scheme -> Option scheme -> Req a) ->
  Req a
withBaseUrl url f = do
  let (isHttps, rest)
        | T.take 8 url == "https://" = (True, T.drop 8 url)
        | T.take 7 url == "http://" = (False, T.drop 7 url)
        | otherwise = error "Invalid url"
      (host, mPort) =
        case T.breakOn ":" rest of
          (h, p)
            | T.null p ->
                (h, Nothing)
            | otherwise ->
                ( h,
                  Just (read (T.unpack (T.drop 1 p)))
                )
  if isHttps
    then f (https host) (maybe mempty port mPort)
    else f (http host) (maybe mempty port mPort)

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
                  pistonRequestFiles = E.files request,
                  pistonRequestRunTimeout = E.runTimeout request,
                  pistonRequestRunMemoryLimit = E.runMemoryLimit request
                }
        res <- executeReq (url piston) pistonReq
        return $
          case pistonResponseRun res of
            Just run ->
              if T.null (pistonResponseStderr run)
                then case pistonResponseStatus run of
                  OK -> E.ExecSuc {E.stdout = pistonResponseStdout run}
                  TLE -> E.ExecFail {E.status = E.TLE, E.stderr = handleExceptionStderrEdgeCase run, E.stdout = pistonResponseStdout run}
                  RE -> E.ExecFail {E.status = E.RE, E.stderr = handleExceptionStderrEdgeCase run, E.stdout = pistonResponseStdout run}
                  Unknown m -> E.ExecFail {E.status = E.Unknown m, E.stderr = handleExceptionStderrEdgeCase run, E.stdout = pistonResponseStdout run}
                else E.ExecFail {E.status = E.RE, E.stderr = handleExceptionStderrEdgeCase run, E.stdout = pistonResponseStdout run}
            Nothing -> error "Piston response does not contain run field"
      Nothing -> fail ("There is no " ++ show (E.language request) ++ " language")

handleExceptionStderrEdgeCase :: PistonExecuteRun -> T.Text
handleExceptionStderrEdgeCase run = if T.null (pistonResponseStderr run) then pistonResponseStdout run else pistonResponseStderr run

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
    other -> Unknown other
  parseJSON invalid = typeMismatch "PistonExecuteRunStatus" invalid

instance ToJSON PistonExecuteRequest where
  toJSON req =
    object
      [ "language" .= pistonRequestLanguage req,
        "version" .= pistonRequestVersion req,
        "files"
          .= ( object ["content" .= pistonRequestContent req]
                 : [ object
                       [ "name" .= E.fileName extraFile,
                         "content" .= E.fileContent extraFile
                       ]
                   | extraFile <- pistonRequestFiles req
                   ]
             ),
        "run_timeout" .= pistonRequestRunTimeout req,
        "run_memory_limit" .= pistonRequestRunMemoryLimit req
      ]
