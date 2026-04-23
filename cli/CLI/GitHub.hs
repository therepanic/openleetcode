{-# LANGUAGE OverloadedStrings #-}

module CLI.GitHub where

import Codec.Archive.Zip
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
