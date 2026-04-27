module CLI.Submit where

import CLI.AppEnv (Config (backendType, backendUrl), defaultConfigRoot, loadConfig)
import Control.Monad (forM, when)
import Core.Executor.Any (convertExecutorTypeToExecutor)
import Core.Generator.Splitmix (SplitmixGenerator (SplitmixGenerator))
import Core.Test.Loader (loadTestSuite)
import Core.Test.Runner (SolutionBatch (SolutionBatch, entryMain, entryTime, python3Utilities, sbLang, solution, utilities), TestResult (Pass, RE, TLE, WA), runSuite)
import Core.Types (Language, convertExtToLang, convertLangToExt, convertLangToStr)
import Data.List (find, isInfixOf, isPrefixOf)
import Data.Maybe (fromMaybe, isNothing)
import System.Directory (listDirectory)
import System.FilePath (takeExtension, (</>))

data SubmitOpts = SubmitOpts
  { submitPath :: FilePath,
    submitId :: Maybe Int,
    submitTitle :: Maybe String,
    submitLang :: Maybe Language
  }

run :: SubmitOpts -> IO ()
run opts = do
  validateSubmit opts
  root <- defaultConfigRoot
  config <- loadConfig
  let runtimes = root </> "runtimes"
  let lang = fromMaybe (convertExtToLang (takeExtension (submitPath opts))) (submitLang opts)
  let extStr = convertLangToExt lang
  entryMainStr <- readFile (runtimes </> convertLangToStr lang </> "main" ++ extStr)
  entryTimeStr <- readFile (runtimes </> convertLangToStr lang </> "time" ++ extStr)
  solutionStr <- readFile (submitPath opts)
  utilitiesStr <- readFile (runtimes </> convertLangToStr lang </> "utilities" ++ extStr)
  python3UtilitiesStr <- readFile (runtimes </> "python3" </> "utilities.py")
  testSuitePath <- findTestPath root opts
  testSuite <- loadTestSuite testSuitePath
  let batch = SolutionBatch {entryMain = entryMainStr, entryTime = entryTimeStr, sbLang = lang, utilities = utilitiesStr, solution = solutionStr, python3Utilities = python3UtilitiesStr}
  let executor = convertExecutorTypeToExecutor (backendType config) (backendUrl config)
  let generator = SplitmixGenerator
  results <- runSuite executor generator batch testSuite
  let isPass :: TestResult -> Bool
      isPass (Pass _) = True
      isPass _ = False
  let failures = [(i, res) | (i, res) <- zip [1 ..] results, not (isPass res)]
  case failures of
    ((idx, err) : _) -> printError (idx, err)
    [] -> do
      let times = [t | Pass t <- results]
      let maxTime = maximum times
      putStrLn $ "All tests passed (" ++ show maxTime ++ "ms)"

validateSubmit :: SubmitOpts -> IO ()
validateSubmit opts =
  when (isNothing (submitId opts) && isNothing (submitTitle opts)) $
    fail "Title or id must be entered"

findTestPath :: FilePath -> SubmitOpts -> IO FilePath
findTestPath root opts = do
  let testsDir = root </> "tests"
  case submitId opts of
    Just taskId -> do
      let low = ((taskId - 1) `div` 500) * 500 + 1
      let rangeDir = testsDir </> (show low ++ "-" ++ show (low + 499))
      subDirs <- listDirectory rangeDir
      case find (\d -> (show taskId ++ ".") `isPrefixOf` d) subDirs of
        Just target -> return (rangeDir </> target </> "manifest.yml")
        Nothing -> fail "Test id folder not found"
    Nothing -> case submitTitle opts of
      Just title -> do
        ranges <- listDirectory testsDir
        paths <- forM ranges $ \r -> do
          let currRange = testsDir </> r
          subs <- listDirectory currRange
          return [currRange </> s | s <- subs, title `isInfixOf` s]
        case concat paths of
          (p : _) -> return (p </> "manifest.yml")
          [] -> fail "Test title not found"
      Nothing -> fail "No id or title"

printError :: (Int, TestResult) -> IO ()
printError (i, WA expected got) =
  putStrLn $ "Test #" ++ show i ++ ": [Wrong Answer] Expected: " ++ fromMaybe "Nothing" expected ++ ", Got: " ++ got
printError (i, TLE) =
  putStrLn $ "Test #" ++ show i ++ ": [Time Limit Exceeded]"
printError (i, RE err) =
  putStrLn $ "Test #" ++ show i ++ ": [Runtime Error] " ++ err
printError _ = putStrLn "Unknown error"
