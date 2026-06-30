{-# LANGUAGE OverloadedStrings #-}

module CLI.Submit where

import CLI.AppEnv
import CLI.Runtime (Runtime (rtUI))
import CLI.SubmitPipeline
import CLI.UI
import Control.Exception (SomeException, finally, try)
import Control.Monad (forM)
import Core.Executor.Any (convertExecutorTypeToExecutor)
import Core.Executor.Piston qualified as Piston
import Core.Generator.Splitmix (SplitmixGenerator (SplitmixGenerator))
import Core.Test.Loader (loadTestSuite)
import Core.Test.Runner
  ( SolutionBatch (SolutionBatch, entryMain, python3Utilities, sbLang, sbTimeout, solution, utilities),
    TestResult (Internal, Pass, RE, TLE, WA),
    runSuiteWithProgress,
  )
import Core.Test.Types qualified as TestTypes
import Core.Types (Language, convertExtToLangMaybe, convertLangToExt, convertLangToStr)
import Data.Char (isAsciiLower)
import Data.List (find, isInfixOf, isPrefixOf)
import Data.Map qualified as M
import Data.Maybe (fromMaybe, isNothing)
import Data.Text (Text)
import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import System.Directory (doesDirectoryExist, doesFileExist, listDirectory)
import System.FilePath (takeExtension, (</>))

data SubmitOpts = SubmitOpts
  { submitPath :: FilePath,
    submitId :: Maybe Int,
    submitTitle :: Maybe Text,
    submitLang :: Maybe Language
  }

run :: Runtime -> SubmitOpts -> IO Int
run runtime opts = do
  let ui = rtUI runtime
  case validateSubmit opts of
    Just failure -> do
      renderSubmitFailure ui failure
      pure (submitFailureExitCode failure)
    Nothing -> do
      prepared <- prepareSubmit ui opts
      case prepared of
        Left failure -> do
          renderSubmitFailure ui failure
          pure (submitFailureExitCode failure)
        Right resolved -> do
          result <- executeSubmit ui resolved
          case result of
            Left failure -> do
              renderSubmitFailure ui failure
              pure (submitFailureExitCode failure)
            Right totalTime -> do
              renderAccepted ui totalTime
              pure (renderExitCode ExitOk)

validateSubmit :: SubmitOpts -> Maybe SubmitFailure
validateSubmit opts
  | isNothing (submitId opts) && isNothing (submitTitle opts) = Just SubmitMissingSelector
  | otherwise = Nothing

prepareSubmit :: UI -> SubmitOpts -> IO (Either SubmitFailure SubmitResolved)
prepareSubmit ui opts = do
  preparingChecklist <- emitPreparingHeader ui
  flip finally (stopMaybeChecklist preparingChecklist) $ do
    configResult <- loadConfig
    emitConfigWarning ui configResult
    emitPreparingStep ui preparingChecklist 0 "load configuration"
    root <- defaultConfigRoot
    case resolveLanguage opts of
      Left failure -> failSubmitStep preparingChecklist failure
      Right lang -> do
        emitPreparingStep ui preparingChecklist 1 "resolve problem"
        suitePathResult <- findTestPath root opts
        case suitePathResult of
          Left failure -> failSubmitStep preparingChecklist failure
          Right suitePath -> do
            suiteResult <- try (loadTestSuite suitePath) :: IO (Either SomeException TestTypes.TestSuite)
            case suiteResult of
              Left exc -> failSubmitStep preparingChecklist (SubmitInfraFailure (classifyException exc))
              Right testSuite -> do
                emitPreparingStep ui preparingChecklist 2 ("load test suite (" ++ show (length (TestTypes.tsCases testSuite)) ++ " cases)")
                runtimeResult <- loadRuntimeTemplates root lang
                case runtimeResult of
                  Left failure -> failSubmitStep preparingChecklist failure
                  Right (entryMainStr, utilitiesStr, python3UtilitiesStr) -> do
                    emitPreparingStep ui preparingChecklist 3 ("load runtime templates (" ++ T.unpack (convertLangToStr lang) ++ ")")
                    solutionResult <- try (TIO.readFile (submitPath opts)) :: IO (Either SomeException Text)
                    case solutionResult of
                      Left exc -> failSubmitStep preparingChecklist (SubmitSolutionReadError (submitPath opts) (sanitizeSingleLine (T.pack (show exc))))
                      Right solutionStr -> do
                        emitPreparingStep ui preparingChecklist 4 "read solution"
                        let config = clrConfig configResult
                        let batch =
                              SolutionBatch
                                { entryMain = entryMainStr,
                                  sbLang = lang,
                                  utilities = utilitiesStr,
                                  sbTimeout = batchTimeoutMs,
                                  solution = solutionStr,
                                  python3Utilities = python3UtilitiesStr
                                }
                        pure $
                          Right
                            SubmitResolved
                              { srConfig = config,
                                srLang = lang,
                                srBatch = batch,
                                srTestSuite = testSuite
                              }

executeSubmit :: UI -> SubmitResolved -> IO (Either SubmitFailure Int)
executeSubmit ui resolved = do
  let config = srConfig resolved
  let backUrl = backendUrl config
  let backLabel = show (backendType config)
  runningChecklist <- emitRunningHeader ui backLabel (T.unpack backUrl)
  flip finally (stopMaybeChecklist runningChecklist) $ do
    backendReady <- try (Piston.getRuntimes backUrl) :: IO (Either SomeException (M.Map Language Text))
    case backendReady of
      Left _ -> failSubmitStep runningChecklist (SubmitBackendUnavailable backUrl)
      Right _ -> do
        emitBackendReady ui runningChecklist backLabel (T.unpack backUrl) (length (TestTypes.tsCases (srTestSuite resolved)))
        let executor = convertExecutorTypeToExecutor (backendType config) backUrl
        let generator = SplitmixGenerator
        resultsOrError <-
          try $
            runSuiteWithProgress
              executor
              generator
              (srBatch resolved)
              (srTestSuite resolved)
              (emitRunningProgress ui runningChecklist)
        case resultsOrError of
          Left exc ->
            failSubmitStep runningChecklist (classifySuiteException exc)
          Right results ->
            case find (\(_, res) -> case res of Pass _ -> False; _ -> True) results of
              Just (idx, verdict) ->
                failSubmitStep runningChecklist $
                  case verdict of
                    Internal msg
                      | isOracleExecutionMessage msg -> SubmitInternalWhileJudging (Just idx) (stripOracleExecutionPrefix msg)
                      | otherwise -> SubmitJudgeInternal (Just idx) (stripOracleExecutionPrefix msg)
                    _ -> SubmitVerdict idx verdict
              Nothing -> pure (Right (sum [t | (_, Pass t) <- results]))

loadRuntimeTemplates :: FilePath -> Language -> IO (Either SubmitFailure (Text, Text, Text))
loadRuntimeTemplates root lang = do
  let runtimes = root </> "runtimes"
  let extStr = T.unpack (convertLangToExt lang)
  let langDir = runtimes </> T.unpack (convertLangToStr lang)
  mainResult <- try (TIO.readFile (langDir </> ("main" ++ extStr))) :: IO (Either SomeException Text)
  utilitiesResult <- try (TIO.readFile (langDir </> ("utilities" ++ extStr))) :: IO (Either SomeException Text)
  pyUtilsResult <- try (TIO.readFile (runtimes </> "python3" </> "utilities.py")) :: IO (Either SomeException Text)
  pure $ do
    entryMainStr <- either (Left . SubmitInfraFailure . classifyException) Right mainResult
    utilitiesStr <- either (Left . SubmitInfraFailure . classifyException) Right utilitiesResult
    python3UtilitiesStr <- either (Left . SubmitInfraFailure . classifyException) Right pyUtilsResult
    Right (entryMainStr, utilitiesStr, python3UtilitiesStr)

resolveLanguage :: SubmitOpts -> Either SubmitFailure Language
resolveLanguage opts = case submitLang opts of
  Just lang -> Right lang
  Nothing ->
    case convertExtToLangMaybe (T.pack (takeExtension (submitPath opts))) of
      Just lang -> Right lang
      Nothing -> Left (SubmitUnknownExtension (T.pack (takeExtension (submitPath opts))))

findTestPath :: FilePath -> SubmitOpts -> IO (Either SubmitFailure FilePath)
findTestPath root opts = do
  let testsDir = root </> "tests"
  case submitId opts of
    Just taskId -> do
      let low = ((taskId - 1) `div` 500) * 500 + 1
      let rangeDir = testsDir </> (show low ++ "-" ++ show (low + 499))
      rangeExists <- doesDirectoryExist rangeDir
      if not rangeExists
        then pure (Left (SubmitSuiteNotFoundById taskId))
        else do
          subDirs <- listDirectory rangeDir
          case find (\d -> (show taskId ++ ".") `isPrefixOf` d) subDirs of
            Just target -> resolveManifestPath (rangeDir </> target)
            Nothing -> pure (Left (SubmitSuiteNotFoundById taskId))
    Nothing -> case submitTitle opts of
      Just title -> do
        testsExist <- doesDirectoryExist testsDir
        if not testsExist
          then pure (Left (SubmitSuiteNotFoundByTitle title))
          else do
            ranges <- listDirectory testsDir
            paths <- forM ranges $ \r -> do
              let currRange = testsDir </> r
              rangeExists <- doesDirectoryExist currRange
              if not rangeExists
                then pure []
                else do
                  subs <- listDirectory currRange
                  pure [currRange </> s | s <- subs, T.unpack title `isInfixOf` s]
            case concat paths of
              (p : _) -> resolveManifestPath p
              [] -> pure (Left (SubmitSuiteNotFoundByTitle title))
      Nothing -> pure (Left SubmitMissingSelector)

resolveManifestPath :: FilePath -> IO (Either SubmitFailure FilePath)
resolveManifestPath problemDir = do
  let candidates = [problemDir </> "manifest.yaml", problemDir </> "manifest.yml"]
  existing <- findFirstExisting candidates
  pure $ maybe (Left (SubmitInfraFailure "Test suite manifest is missing")) Right existing

findFirstExisting :: [FilePath] -> IO (Maybe FilePath)
findFirstExisting [] = pure Nothing
findFirstExisting (path : rest) = do
  exists <- doesFileExist path
  if exists
    then pure (Just path)
    else findFirstExisting rest

emitPreparingHeader :: UI -> IO (Maybe Checklist)
emitPreparingHeader ui = case uiMode ui of
  Rich ->
    startChecklist
      ui
      "Preparing…"
      [ ChecklistStep StepActive "Load configuration",
        ChecklistStep StepPending "Resolve problem",
        ChecklistStep StepPending "Load test suite",
        ChecklistStep StepPending "Load runtime templates",
        ChecklistStep StepPending "Read solution"
      ]
  Plain -> pure Nothing

emitPreparingStep :: UI -> Maybe Checklist -> Int -> String -> IO ()
emitPreparingStep ui maybeChecklist idx msg = case uiMode ui of
  Rich -> case maybeChecklist of
    Just checklist -> do
      updateChecklistStep checklist idx StepDone (T.pack (capitalize msg))
      advanceChecklist checklist (idx + 1)
    Nothing -> pure ()
  Plain -> putPlain "submit" "preparing" (T.pack msg)

advanceChecklist :: Checklist -> Int -> IO ()
advanceChecklist checklist idx =
  updateChecklistStep checklist idx StepActive =<< nextStepText idx
  where
    nextStepText 1 = pure "Resolve problem"
    nextStepText 2 = pure "Load test suite"
    nextStepText 3 = pure "Load runtime templates"
    nextStepText 4 = pure "Read solution"
    nextStepText _ = pure ""

emitRunningHeader :: UI -> String -> String -> IO (Maybe Checklist)
emitRunningHeader ui backendLabel backendUrl = case uiMode ui of
  Rich ->
    startChecklist
      ui
      "Running tests…"
      [ ChecklistStep StepActive (T.pack ("Connect to backend (" ++ backendLabel ++ " @ " ++ backendUrl ++ ")")),
        ChecklistStep StepPending "Run tests"
      ]
  Plain -> pure Nothing

emitBackendReady :: UI -> Maybe Checklist -> String -> String -> Int -> IO ()
emitBackendReady ui maybeChecklist backendLabel backendUrl _total = case uiMode ui of
  Rich -> case maybeChecklist of
    Just checklist -> do
      updateChecklistStep checklist 0 StepDone (T.pack ("Connect to backend (" ++ backendLabel ++ " @ " ++ backendUrl ++ ")"))
      updateChecklistStep checklist 1 StepActive "Run tests"
    Nothing -> pure ()
  Plain -> putPlain "submit" "running" (T.pack ("backend " ++ backendLabel ++ " @ " ++ backendUrl))

emitRunningProgress :: UI -> Maybe Checklist -> Int -> Int -> IO ()
emitRunningProgress ui maybeChecklist done total = case uiMode ui of
  Rich -> case maybeChecklist of
    Just checklist ->
      updateChecklistStep checklist 1 (if done == total then StepDone else StepActive) "Run tests"
    Nothing -> pure ()
  Plain -> pure ()

renderAccepted :: UI -> Int -> IO ()
renderAccepted ui maxTime = case uiMode ui of
  Rich -> do
    putSuccess ui "All tests passed"
    putStrLn ("Runtime: " ++ show maxTime ++ " ms")
  Plain -> do
    putPlain "submit" "verdict" "accepted"
    putPlain "submit" "verdict" (T.pack ("runtime: " ++ show maxTime))

renderSubmitFailure :: UI -> SubmitFailure -> IO ()
renderSubmitFailure ui failure = case failure of
  SubmitMissingSelector -> do
    renderErrorHeader ui "submit" "Missing problem selector."
    emitDetail ui "submit" "Provide either --id <number> or --title \"<substring>\""
    emitDetail ui "submit" "Example:"
    emitDetail ui "submit" "  openleetcode submit ./solution.py --id 1"
  SubmitSolutionReadError path reason -> do
    renderErrorHeader ui "submit" ("Could not read solution file: " ++ path)
    emitDetail ui "submit" (T.unpack reason)
  SubmitUnknownExtension ext -> do
    renderErrorHeader ui "submit" ("Unknown file extension for language detection: '" ++ T.unpack ext ++ "'")
    emitDetail ui "submit" "Use --lang <LANG> (see --help for supported values)"
  SubmitSuiteNotFoundById taskId ->
    renderErrorHeader ui "submit" ("Test suite not found for problem id " ++ show taskId)
  SubmitSuiteNotFoundByTitle title ->
    renderErrorHeader ui "submit" ("Test suite not found for title matching: \"" ++ T.unpack title)
  SubmitBackendUnavailable backendUrl -> do
    renderErrorHeader ui "submit" ("Backend is not reachable: " ++ T.unpack backendUrl)
    emitDetail ui "submit" "Check `openleetcode config list` and your backend service"
  SubmitJudgeInternal maybeIdx msg -> do
    renderErrorHeader ui "submit" $
      case maybeIdx of
        Just idx -> "Judge internal error on test #" ++ show idx
        Nothing -> "Judge internal error"
    emitDetail ui "submit" ("  " ++ T.unpack msg)
  SubmitInternalWhileJudging maybeIdx msg -> do
    renderErrorHeader ui "submit" $
      case maybeIdx of
        Just idx -> "Internal error while judging test #" ++ show idx
        Nothing -> "Internal error while judging"
    emitDetail ui "submit" ("  " ++ T.unpack msg)
  SubmitInfraFailure msg ->
    renderErrorHeader ui "submit" ("Internal error: " ++ T.unpack msg)
  SubmitVerdict idx verdict -> renderVerdict ui idx verdict

renderVerdict :: UI -> Int -> TestResult -> IO ()
renderVerdict ui idx verdict = case verdict of
  WA expected got out -> do
    renderVerdictHeader ui "wa" ("Wrong answer on test #" ++ show idx)
    emitVerdictDetail ui "wa" ("  Output: " ++ T.unpack got)
    emitVerdictDetail ui "wa" ("  Expected: " ++ T.unpack (fromMaybe "Multiple valid outputs allowed" expected))
    if T.null out
      then pure ()
      else do
        emitVerdictDetail ui "wa" "  Stdout:"
        emitVerdictDetail ui "wa" (T.unpack out)
  TLE out -> do
    renderVerdictHeader ui "tle" ("Time limit exceeded on test #" ++ show idx)
    if T.null out
      then pure ()
      else do
        emitVerdictDetail ui "tle" "  Stdout:"
        emitVerdictDetail ui "tle" (T.unpack out)
  RE err out -> do
    renderVerdictHeader ui "re" ("Runtime error on test #" ++ show idx)
    emitVerdictDetail ui "re" ("  " ++ T.unpack err)
    if T.null out
      then pure ()
      else do
        emitVerdictDetail ui "re" "  Stdout:"
        emitVerdictDetail ui "re" (T.unpack out)
  Internal msg -> do
    renderErrorHeader ui "submit" ("Judge internal error on test #" ++ show idx)
    emitDetail ui "submit" ("  " ++ T.unpack (stripOracleExecutionPrefix msg))
  Pass _ -> pure ()

renderErrorHeader :: UI -> String -> String -> IO ()
renderErrorHeader ui scope msg = case uiMode ui of
  Rich -> putErrorLine ui (T.pack msg)
  Plain -> putPlain (T.pack scope) "error" (T.pack msg)

renderVerdictHeader :: UI -> String -> String -> IO ()
renderVerdictHeader ui verdictTag msg = case uiMode ui of
  Rich -> putErrorLine ui (T.pack msg)
  Plain -> putPlain "submit" (T.pack ("verdict: " ++ verdictTag)) (T.pack msg)

emitVerdictDetail :: UI -> String -> String -> IO ()
emitVerdictDetail ui verdictTag msg = case uiMode ui of
  Rich -> putStrLn msg
  Plain -> putPlain "submit" (T.pack ("verdict: " ++ verdictTag)) (T.pack msg)

emitDetail :: UI -> String -> String -> IO ()
emitDetail ui scope msg = case uiMode ui of
  Rich -> putStrLn msg
  Plain -> putPlain (T.pack scope) "" (T.pack msg)

submitFailureExitCode :: SubmitFailure -> Int
submitFailureExitCode failure = case failure of
  SubmitMissingSelector -> renderExitCode ExitInput
  SubmitSolutionReadError _ _ -> renderExitCode ExitInput
  SubmitUnknownExtension _ -> renderExitCode ExitInput
  SubmitSuiteNotFoundById _ -> renderExitCode ExitInput
  SubmitSuiteNotFoundByTitle _ -> renderExitCode ExitInput
  SubmitBackendUnavailable _ -> renderExitCode ExitInfra
  SubmitInternalWhileJudging _ _ -> renderExitCode ExitInfra
  SubmitJudgeInternal _ _ -> renderExitCode ExitInfra
  SubmitInfraFailure _ -> renderExitCode ExitInfra
  SubmitVerdict _ _ -> renderExitCode ExitVerdict

classifySuiteException :: SomeException -> SubmitFailure
classifySuiteException exc =
  if "Oracle execution error:" `isInfixOf` shown
    then SubmitInternalWhileJudging Nothing (stripOracleExecutionPrefix (T.pack shown))
    else SubmitInfraFailure (classifyException exc)
  where
    shown = show exc

isOracleExecutionMessage :: Text -> Bool
isOracleExecutionMessage = T.isInfixOf "Oracle execution error:"

stripOracleExecutionPrefix :: Text -> Text
stripOracleExecutionPrefix msg =
  case T.splitAt prefixLen msg of
    (prefix, rest)
      | prefix == oraclePrefix -> trimLeadingSpace rest
    _ -> msg
  where
    oraclePrefix = "Oracle execution error:"
    prefixLen = T.length oraclePrefix

trimLeadingSpace :: Text -> Text
trimLeadingSpace = T.dropWhile (== ' ')

capitalize :: String -> String
capitalize [] = []
capitalize (x : xs) = toUpperAscii x : xs

toUpperAscii :: Char -> Char
toUpperAscii c
  | isAsciiLower c = toEnum (fromEnum c - 32)
  | otherwise = c

failSubmitStep :: Maybe Checklist -> SubmitFailure -> IO (Either SubmitFailure a)
failSubmitStep Nothing failure = pure (Left failure)
failSubmitStep (Just checklist) failure = do
  failActiveChecklistStep checklist
  pure (Left failure)

batchTimeoutMs :: Int
batchTimeoutMs = 20000
