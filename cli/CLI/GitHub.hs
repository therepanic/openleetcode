{-# LANGUAGE OverloadedStrings #-}

module CLI.GitHub where

import CLI.AppEnv
import Codec.Archive.Zip
import Data.List (isPrefixOf)
import Network.HTTP.Req
import System.Directory (createDirectoryIfMissing)

-- todo: for runtimes, we could consider downloading files directly since there are few of them, and also perhaps optimize the current logic somehow.

downloadTests :: IO ()
downloadTests = do
  archive <- downloadRepoArchive
  let strip e = e {eRelativePath = drop (length ("openleetcode-main/" :: String)) (eRelativePath e)}
      filtered =
        archive
          { zEntries =
              map strip $
                filter (isPrefixOf "openleetcode-main/tests/" . eRelativePath) $
                  zEntries archive
          }
  root <- defaultConfigRoot
  createDirectoryIfMissing True root
  extractFilesFromArchive [OptDestination root] filtered

downloadRuntimes :: IO ()
downloadRuntimes = do
  archive <- downloadRepoArchive
  let strip e = e {eRelativePath = drop (length ("openleetcode-main/" :: String)) (eRelativePath e)}
      filtered =
        archive
          { zEntries =
              map strip $
                filter (isPrefixOf "openleetcode-main/runtimes/" . eRelativePath) $
                  zEntries archive
          }
  root <- defaultConfigRoot
  createDirectoryIfMissing True root
  extractFilesFromArchive [OptDestination root] filtered

downloadAll :: IO ()
downloadAll = do
  downloadRuntimes
  downloadTests

downloadRepoArchive :: IO Archive
downloadRepoArchive = do
  body <- runReq defaultHttpConfig $ do
    -- note that we are taking the code from the main branch. also repo hardcoded
    response <- req GET (https "github.com" /: "therepanic" /: "openleetcode" /: "archive" /: "refs" /: "heads" /: "main.zip") NoReqBody lbsResponse mempty
    return (responseBody response)
  let archive = toArchive body
  return archive
