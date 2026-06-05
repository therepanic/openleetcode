{-# LANGUAGE OverloadedStrings #-}

module CLI.GitHub where

import Codec.Archive.Zip
import Data.ByteString.Lazy qualified as LBS
import Network.HTTP.Req

-- todo:  we could consider also perhaps optimize the current logic somehow.

downloadRepoArchive :: IO Archive
downloadRepoArchive = do
  body <- runReq defaultHttpConfig $ do
    -- note that we are taking the code from the main branch. also repo hardcoded
    response <- req GET (https "github.com" /: "therepanic" /: "openleetcode" /: "archive" /: "refs" /: "heads" /: "main.zip") NoReqBody lbsResponse mempty
    return (responseBody response)
  let archive = toArchive body
  return archive

downloadInstaller :: Bool -> IO LBS.ByteString
downloadInstaller isWindows = runReq defaultHttpConfig $ do
  let url =
        if isWindows
          then https "raw.githubusercontent.com" /: "therepanic" /: "openleetcode" /: "main" /: "install.ps1"
          else https "raw.githubusercontent.com" /: "therepanic" /: "openleetcode" /: "main" /: "install.sh"
  response <- req GET url NoReqBody lbsResponse mempty
  pure (responseBody response)
