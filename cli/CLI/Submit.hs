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
  ( SolutionBatch (SolutionBatch, entryMain, entryTime, python3Utilities, sbLang, solution, utilities),
    TestResult (Internal, Pass, RE, TLE, WA),
    runSuiteWithProgress,
  )
import Core.Test.Types qualified as TestTypes
import Core.Types (Language, convertExtToLangMaybe, convertLangToExt, convertLangToStr)
import Data.IORef (IORef, newIORef, readIORef, writeIORef)
import Data.List (find, isInfixOf, isPrefixOf)
import Data.Map qualified as M
import Data.Maybe (fromMaybe)
import Data.Word (Word64)
import GHC.Clock (getMonotonicTimeNSec)
import System.Directory (doesDirectoryExist, listDirectory)
import System.FilePath (takeExtension, (</>))

data SubmitOpts = SubmitOpts
  { submitPath :: FilePath,
    submitId :: Maybe Int,
    submitTitle :: Maybe String,
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
            Right maxTime -> do
              renderAccepted ui maxTime
              pure (renderExitCode ExitOk)

validateSubmit :: SubmitOpts -> Maybe SubmitFailure
validateSubmit opts
  | submitId opts == Nothing && submitTitle opts == Nothing = Just SubmitMissingSelector
  | otherwise = Nothing

prepareSubmit :: UI -> SubmitOpts -> IO (Either SubmitFailure SubmitResolved)
prepareSubmit ui opts = do
  preparingChecklist <- emitPreparingHeader ui
  flip finally (stopMaybeChecklist preparingChecklist) $ do
    configResult <- loadConfigDetailed
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
                  Right (entryMainStr, entryTimeStr, utilitiesStr, python3UtilitiesStr) -> do
                    emitPreparingStep ui preparingChecklist 3 ("load runtime templates (" ++ convertLangToStr lang ++ ")")
                    solutionResult <- try (readFile (submitPath opts)) :: IO (Either SomeException String)
                    case solutionResult of
                      Left exc -> failSubmitStep preparingChecklist (SubmitSolutionReadError (submitPath opts) (sanitizeSingleLine (show exc)))
                      Right solutionStr -> do
                        emitPreparingStep ui preparingChecklist 4 "read solution"
                        let config = clrConfig configResult
                        let batch =
                              SolutionBatch
                                { entryMain = entryMainStr,
                                  entryTime = entryTimeStr,
                                  sbLang = lang,
                                  utilities = utilitiesStr,
                                  solution = solutionStr,
                                  python3Utilities = python3UtilitiesStr
                                }
                        pure $
                          Right
                            SubmitResolved
                              { srConfig = config,
                                srLang = lang,
                                srBatch = batch,
                                srTestSuite = testSuite,
                                srBackendLabel = show (backendType config),
                                srBackendUrl = backendUrl config
                              }

executeSubmit :: UI -> SubmitResolved -> IO (Either SubmitFailure Int)
executeSubmit ui resolved = do
  runningChecklist <- emitRunningHeader ui (srBackendLabel resolved) (srBackendUrl resolved)
  flip finally (stopMaybeChecklist runningChecklist) $ do
    backendReady <- try (Piston.getRuntimes (srBackendUrl resolved)) :: IO (Either SomeException (M.Map Language String))
    case backendReady of
      Left _ -> failSubmitStep runningChecklist (SubmitBackendUnavailable (srBackendUrl resolved))
      Right _ -> do
        emitBackendReady ui runningChecklist (srBackendLabel resolved) (srBackendUrl resolved) (length (TestTypes.tsCases (srTestSuite resolved)))
        let executor = convertExecutorTypeToExecutor (backendType (srConfig resolved)) (srBackendUrl resolved)
        let generator = SplitmixGenerator
        progressRef <- newIORef (Nothing :: Maybe Word64)
        resultsOrError <-
          try $
            runSuiteWithProgress
              executor
              generator
              (srBatch resolved)
              (srTestSuite resolved)
              (\done total -> emitRunningProgressThrottled ui runningChecklist progressRef done total)
        case resultsOrError of
          Left exc ->
            failSubmitStep runningChecklist (classifySuiteException exc)
          Right results ->
            case find (\(_, res) -> case res of Pass _ -> False; _ -> True) results of
              Just (idx, verdict) ->
                failSubmitStep runningChecklist $
                  case verdict of
                    Internal msg
                      | isOracleExecutionMessage msg -> SubmitInternalWhileJudging (Just idx) (sanitizeInternalJudgeMessage msg)
                      | otherwise -> SubmitJudgeInternal (Just idx) (sanitizeInternalJudgeMessage msg)
                    _ -> SubmitVerdict idx verdict
              Nothing -> pure (Right (maximum [t | (_, Pass t) <- results]))

loadRuntimeTemplates :: FilePath -> Language -> IO (Either SubmitFailure (String, String, String, String))
loadRuntimeTemplates root lang = do
  let runtimes = root </> "runtimes"
  let extStr = convertLangToExt lang
  let langDir = runtimes </> convertLangToStr lang
  mainResult <- try (readFile (langDir </> ("main" ++ extStr))) :: IO (Either SomeException String)
  timeResult <- try (readFile (langDir </> ("time" ++ extStr))) :: IO (Either SomeException String)
  utilitiesResult <- try (readFile (langDir </> ("utilities" ++ extStr))) :: IO (Either SomeException String)
  pyUtilsResult <- try (readFile (runtimes </> "python3" </> "utilities.py")) :: IO (Either SomeException String)
  pure $ do
    entryMainStr <- either (Left . SubmitInfraFailure . classifyException) Right mainResult
    entryTimeStr <- either (Left . SubmitInfraFailure . classifyException) Right timeResult
    utilitiesStr <- either (Left . SubmitInfraFailure . classifyException) Right utilitiesResult
    python3UtilitiesStr <- either (Left . SubmitInfraFailure . classifyException) Right pyUtilsResult
    Right (entryMainStr, entryTimeStr, utilitiesStr, python3UtilitiesStr)

resolveLanguage :: SubmitOpts -> Either SubmitFailure Language
resolveLanguage opts = case submitLang opts of
  Just lang -> Right lang
  Nothing ->
    case convertExtToLangMaybe (takeExtension (submitPath opts)) of
      Just lang -> Right lang
      Nothing -> Left (SubmitUnknownExtension (takeExtension (submitPath opts)))

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
            Just target -> pure (Right (rangeDir </> target </> "manifest.yml"))
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
                  pure [currRange </> s | s <- subs, title `isInfixOf` s]
            case concat paths of
              (p : _) -> pure (Right (p </> "manifest.yml"))
              [] -> pure (Left (SubmitSuiteNotFoundByTitle title))
      Nothing -> pure (Left SubmitMissingSelector)

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
      updateChecklistStep checklist idx StepDone (capitalize msg)
      advanceChecklist checklist (idx + 1)
    Nothing -> pure ()
  Plain -> putPlain "submit" "preparing" msg

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
      [ ChecklistStep StepActive ("Connect to backend (" ++ backendLabel ++ " @ " ++ backendUrl ++ ")"),
        ChecklistStep StepPending "Run test cases"
      ]
  Plain -> pure Nothing

emitBackendReady :: UI -> Maybe Checklist -> String -> String -> Int -> IO ()
emitBackendReady ui maybeChecklist backendLabel backendUrl total = case uiMode ui of
  Rich -> case maybeChecklist of
    Just checklist -> do
      updateChecklistStep checklist 0 StepDone ("Connect to backend (" ++ backendLabel ++ " @ " ++ backendUrl ++ ")")
      updateChecklistStep checklist 1 StepActive ("Run test cases (0/" ++ show total ++ ")")
    Nothing -> pure ()
  Plain -> putPlain "submit" "running" ("backend " ++ backendLabel ++ " @ " ++ backendUrl)

emitRunningProgress :: UI -> Maybe Checklist -> Int -> Int -> IO ()
emitRunningProgress ui maybeChecklist done total = case uiMode ui of
  Rich -> case maybeChecklist of
    Just checklist ->
      updateChecklistStep checklist 1 (if done == total then StepDone else StepActive) ("Run test cases (" ++ show done ++ "/" ++ show total ++ ")")
    Nothing -> pure ()
  Plain -> putPlain "submit" "running" ("progress " ++ show done ++ "/" ++ show total)

emitRunningProgressThrottled :: UI -> Maybe Checklist -> IORef (Maybe Word64) -> Int -> Int -> IO ()
emitRunningProgressThrottled ui maybeChecklist progressRef done total =
  case uiMode ui of
    Plain -> emitRunningProgress ui maybeChecklist done total
    Rich -> do
      nowMs <- fmap (`div` 1000000) getMonotonicTimeNSec
      lastMs <- readIORef progressRef
      let shouldRender =
            done == total
              || done == 1
              || maybe True (\prev -> nowMs - prev >= 250) lastMs
      if shouldRender
        then do
          writeIORef progressRef (Just nowMs)
          emitRunningProgress ui maybeChecklist done total
        else pure ()

renderAccepted :: UI -> Int -> IO ()
renderAccepted ui maxTime = case uiMode ui of
  Rich -> do
    putSuccess ui "All tests passed"
    putStrLn ("Runtime: " ++ show maxTime ++ " ms")
  Plain -> do
    putPlain "submit" "verdict" "accepted"
    putPlain "submit" "verdict" ("runtime: " ++ show maxTime)

renderSubmitFailure :: UI -> SubmitFailure -> IO ()
renderSubmitFailure ui failure = case failure of
  SubmitMissingSelector -> do
    renderErrorHeader ui "submit" "Missing problem selector."
    emitDetail ui "submit" "Provide either --id <number> or --title \"<substring>\"."
    emitDetail ui "submit" "Example:"
    emitDetail ui "submit" "  openleetcode submit ./solution.py --id 1"
  SubmitSolutionReadError path reason -> do
    renderErrorHeader ui "submit" ("Could not read solution file: " ++ path)
    emitDetail ui "submit" reason
  SubmitUnknownExtension ext -> do
    renderErrorHeader ui "submit" ("Unknown file extension for language detection: '" ++ ext ++ "'")
    emitDetail ui "submit" "Use --lang <LANG> (see --help for supported values)."
  SubmitSuiteNotFoundById taskId ->
    renderErrorHeader ui "submit" ("Test suite not found for problem id " ++ show taskId ++ ".")
  SubmitSuiteNotFoundByTitle title ->
    renderErrorHeader ui "submit" ("Test suite not found for title matching: \"" ++ title ++ "\".")
  SubmitBackendUnavailable backendUrl -> do
    renderErrorHeader ui "submit" ("Backend is not reachable: " ++ backendUrl)
    emitDetail ui "submit" "Check `openleetcode config list` and your backend service."
  SubmitJudgeInternal maybeIdx msg -> do
    renderErrorHeader ui "submit" $
      case maybeIdx of
        Just idx -> "Judge internal error on test #" ++ show idx
        Nothing -> "Judge internal error"
    emitDetail ui "submit" ("  " ++ msg)
  SubmitInternalWhileJudging maybeIdx msg -> do
    renderErrorHeader ui "submit" $
      case maybeIdx of
        Just idx -> "Internal error while judging test #" ++ show idx
        Nothing -> "Internal error while judging"
    emitDetail ui "submit" ("  " ++ msg)
  SubmitInfraFailure msg ->
    renderErrorHeader ui "submit" ("Internal error: " ++ msg)
  SubmitVerdict idx verdict -> renderVerdict ui idx verdict

renderVerdict :: UI -> Int -> TestResult -> IO ()
renderVerdict ui idx verdict = case verdict of
  WA expected got out -> do
    renderVerdictHeader ui "wa" ("Wrong answer on test #" ++ show idx)
    emitVerdictDetail ui "wa" ("  Expected: " ++ fromMaybe "No expected output" expected)
    emitVerdictDetail ui "wa" ("  Got:      " ++ got)
    if null out
      then pure ()
      else do
        emitVerdictDetail ui "wa" "  Logs:"
        emitVerdictDetail ui "wa" out
  TLE out -> do
    renderVerdictHeader ui "tle" ("Time limit exceeded on test #" ++ show idx)
    if null out
      then pure ()
      else do
        emitVerdictDetail ui "tle" "  Logs before time limit:"
        emitVerdictDetail ui "tle" out
  RE err out -> do
    renderVerdictHeader ui "re" ("Runtime error on test #" ++ show idx)
    emitVerdictDetail ui "re" ("  " ++ err)
    if null out
      then pure ()
      else do
        emitVerdictDetail ui "re" "  Logs:"
        emitVerdictDetail ui "re" out
  Internal msg -> do
    renderErrorHeader ui "submit" ("Judge internal error on test #" ++ show idx)
    emitDetail ui "submit" ("  " ++ sanitizeInternalJudgeMessage msg)
  Pass _ -> pure ()

renderErrorHeader :: UI -> String -> String -> IO ()
renderErrorHeader ui scope msg = case uiMode ui of
  Rich -> putErrorLine ui msg
  Plain -> putPlain scope "error" msg

renderVerdictHeader :: UI -> String -> String -> IO ()
renderVerdictHeader ui verdictTag msg = case uiMode ui of
  Rich -> putErrorLine ui msg
  Plain -> putPlain "submit" ("verdict: " ++ verdictTag) msg

emitVerdictDetail :: UI -> String -> String -> IO ()
emitVerdictDetail ui verdictTag msg = case uiMode ui of
  Rich -> putStrLn msg
  Plain -> putPlain "submit" ("verdict: " ++ verdictTag) msg

emitDetail :: UI -> String -> String -> IO ()
emitDetail ui scope msg = case uiMode ui of
  Rich -> putStrLn msg
  Plain -> putPlain scope "" msg

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
    then SubmitInternalWhileJudging Nothing (stripOracleExecutionPrefix (sanitizeSingleLine shown))
    else SubmitInfraFailure (classifyException exc)
  where
    shown = show exc

sanitizeInternalJudgeMessage :: String -> String
sanitizeInternalJudgeMessage = stripOracleExecutionPrefix . sanitizeSingleLine

isOracleExecutionMessage :: String -> Bool
isOracleExecutionMessage = isInfixOf "Oracle execution error:"

stripOracleExecutionPrefix :: String -> String
stripOracleExecutionPrefix msg =
  case splitAt prefixLen msg of
    (prefix, rest)
      | prefix == oraclePrefix -> trimLeadingSpace rest
    _ -> msg
  where
    oraclePrefix = "Oracle execution error:"
    prefixLen = length oraclePrefix

trimLeadingSpace :: String -> String
trimLeadingSpace (' ' : xs) = trimLeadingSpace xs
trimLeadingSpace xs = xs

emitConfigWarning :: UI -> ConfigLoadResult -> IO ()
emitConfigWarning ui result = case clrWarning result of
  Nothing -> pure ()
  Just warn ->
    case uiMode ui of
      Rich -> do
        putStrLn "Warning: could not parse config file, using defaults."
        putStrLn ("Details: " ++ sanitizeSingleLine warn)
      Plain -> do
        putPlain "config" "warning" "could not parse config file, using defaults."
        putPlain "config" "warning" ("Details: " ++ sanitizeSingleLine warn)

capitalize :: String -> String
capitalize [] = []
capitalize (x : xs) = toUpperAscii x : xs

toUpperAscii :: Char -> Char
toUpperAscii c
  | 'a' <= c && c <= 'z' = toEnum (fromEnum c - 32)
  | otherwise = c

stopMaybeChecklist :: Maybe Checklist -> IO ()
stopMaybeChecklist Nothing = pure ()
stopMaybeChecklist (Just checklist) = stopChecklist checklist

failSubmitStep :: Maybe Checklist -> SubmitFailure -> IO (Either SubmitFailure a)
failSubmitStep Nothing failure = pure (Left failure)
failSubmitStep (Just checklist) failure = do
  failActiveChecklistStep checklist
  pure (Left failure)
