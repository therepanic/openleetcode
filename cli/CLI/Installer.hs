module CLI.Installer where

import CLI.AppEnv
import Codec.Archive.Zip
import Data.List (isPrefixOf)
import System.Directory (createDirectoryIfMissing)

unpackRuntimes :: Archive -> IO ()
unpackRuntimes archive = do
  let filtered =
        archive
          { zEntries =
              map stripArchivePrefix $
                filter (isPrefixOf "openleetcode-main/runtimes/" . eRelativePath) $
                  zEntries archive
          }
  root <- defaultConfigRoot
  createDirectoryIfMissing True root
  extractFilesFromArchive [OptDestination root] filtered

unpackTests :: Archive -> IO ()
unpackTests archive = do
  let filtered =
        archive
          { zEntries =
              map stripArchivePrefix $
                filter (isPrefixOf "openleetcode-main/tests/" . eRelativePath) $
                  zEntries archive
          }
  root <- defaultConfigRoot
  createDirectoryIfMissing True root
  extractFilesFromArchive [OptDestination root] filtered

stripArchivePrefix :: Entry -> Entry
stripArchivePrefix e = e {eRelativePath = drop (length ("openleetcode-main/" :: String)) (eRelativePath e)}
