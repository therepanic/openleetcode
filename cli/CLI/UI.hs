{-# LANGUAGE CPP #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module CLI.UI where

import CLI.AppEnv (ConfigLoadResult (clrWarning))
import Control.Concurrent (forkIO, threadDelay)
import Control.Concurrent.MVar (MVar, newMVar, withMVar)
import Control.Exception (SomeException, displayException, try)
import Control.Monad (unless, when)
import Data.Bits ((.|.))
import Data.Char (toLower)
import Data.Foldable (for_)
import Data.IORef (IORef, atomicModifyIORef', modifyIORef', newIORef, readIORef, writeIORef)
import Data.List (isInfixOf)
import Data.Maybe (isJust, isNothing)
import Data.Text (Text)
import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import System.Environment (lookupEnv)
import System.IO (Handle, hFlush, hIsTerminalDevice, stdin, stdout)
import System.Info (os)
#if defined(mingw32_HOST_OS)
import System.Win32.Console (eNABLE_PROCESSED_OUTPUT, eNABLE_VIRTUAL_TERMINAL_PROCESSING, getConsoleMode, setConsoleMode)
import System.Win32.Types (withHandleToHANDLE)
#endif

data ColorMode = ColorAuto
  deriving (Eq, Show)

data OutputMode = Rich | Plain
  deriving (Eq, Show)

data GlobalOptions = GlobalOptions
  { goPlain :: Bool,
    goNoColor :: Bool,
    goColorMode :: ColorMode
  }

data UI = UI
  { uiMode :: OutputMode,
    uiUseColor :: Bool,
    uiSymbols :: UISymbols
  }

data StepStatus = StepPending | StepActive | StepDone | StepFailed
  deriving (Eq, Show)

data ChecklistStep = ChecklistStep
  { csStatus :: StepStatus,
    csText :: Text
  }

data Checklist = Checklist
  { clUI :: UI,
    clHeader :: Text,
    clStepsRef :: IORef [ChecklistStep],
    clFrameRef :: IORef Int,
    clRenderedRef :: IORef Bool,
    clStopRef :: IORef Bool,
    clRenderLock :: MVar ()
  }

data SymbolSet = UnicodeSymbols | AsciiSymbols deriving (Eq, Show)

data UISymbols = UISymbols
  { symSuccess :: Char,
    symError :: Char,
    symPending :: Char,
    symSpinnerFrames :: String
  }

data ExitCodeKind = ExitOk | ExitInput | ExitInfra | ExitVerdict

mkUI :: GlobalOptions -> IO UI
mkUI opts = do
  stdoutSupportsRich <- supportsRichOutput stdout
  noColorEnv <- lookupEnv "NO_COLOR"
  let richAllowed = stdoutSupportsRich && not (goPlain opts)
  let mode = if richAllowed then Rich else Plain
  let useColor = mode == Rich && not (goNoColor opts) && isNothing noColorEnv
  unicodeOk <- supportsUnicodeSymbols stdout
  let symbolSet =
        if mode == Rich && unicodeOk
          then UnicodeSymbols
          else AsciiSymbols
  pure
    UI
      { uiMode = mode,
        uiUseColor = useColor,
        uiSymbols = symbolsFor symbolSet
      }

-- Source: https://github.com/sindresorhus/is-unicode-supported/blob/main/index.js
supportsUnicodeSymbols :: Handle -> IO Bool
supportsUnicodeSymbols handle = do
  if os /= "mingw32"
    then hIsTerminalDevice handle
    else do
      wtSession <- lookupEnv "WT_SESSION"
      terminusSublime <- lookupEnv "TERMINUS_SUBLIME"
      conEmuTask <- lookupEnv "ConEmuTask"
      termProgram <- lookupEnv "TERM_PROGRAM"
      term <- lookupEnv "TERM"
      terminalEmulator <- lookupEnv "TERMINAL_EMULATOR"
      pure $
        isJust wtSession
          || isJust terminusSublime
          || conEmuTask == Just "{cmd::Cmder}"
          || termProgram == Just "Terminus-Sublime"
          || termProgram == Just "vscode"
          || term == Just "xterm-256color"
          || term == Just "alacritty"
          || term == Just "rxvt-unicode"
          || term == Just "rxvt-unicode-256color"
          || terminalEmulator == Just "JetBrains-JediTerm"

stdinIsInteractive :: IO Bool
stdinIsInteractive = supportsInteractiveInput stdin

supportsRichOutput :: Handle -> IO Bool
supportsRichOutput handle
  | os /= "mingw32" = hIsTerminalDevice handle
  | otherwise = supportsWindowsVT handle

supportsInteractiveInput :: Handle -> IO Bool
supportsInteractiveInput handle
  | os /= "mingw32" = hIsTerminalDevice handle
  | otherwise = isWindowsConsoleHandle handle

supportsWindowsVT :: Handle -> IO Bool
#if defined(mingw32_HOST_OS)
supportsWindowsVT handle = do
  result <-
    ( try $
        withHandleToHANDLE handle $ \winHandle -> do
          mode <- getConsoleMode winHandle
          setConsoleMode winHandle (mode .|. eNABLE_PROCESSED_OUTPUT .|. eNABLE_VIRTUAL_TERMINAL_PROCESSING)
    ) ::
      IO (Either SomeException ())
  pure (either (const False) (const True) result)
#else
supportsWindowsVT _ = pure False
#endif

isWindowsConsoleHandle :: Handle -> IO Bool
#if defined(mingw32_HOST_OS)
isWindowsConsoleHandle handle = do
  result <-
    ( try $
        withHandleToHANDLE handle $ \winHandle -> do
          _ <- getConsoleMode winHandle
          pure ()
    ) ::
      IO (Either SomeException ())
  pure (either (const False) (const True) result)
#else
isWindowsConsoleHandle _ = pure False
#endif

renderExitCode :: ExitCodeKind -> Int
renderExitCode = \case
  ExitOk -> 0
  ExitInput -> 1
  ExitInfra -> 2
  ExitVerdict -> 3

plainLine :: Text -> Text -> Text -> Text
plainLine scope section msg =
  scope <> suffix <> msg
  where
    suffix =
      if T.null section
        then ": "
        else ": " <> section <> ": "

symbolsFor :: SymbolSet -> UISymbols
symbolsFor UnicodeSymbols =
  UISymbols
    { symSuccess = '✓',
      symError = '✗',
      symPending = '·',
      symSpinnerFrames = "⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
    }
symbolsFor AsciiSymbols =
  UISymbols
    { symSuccess = '√',
      symError = 'x',
      symPending = '.',
      symSpinnerFrames = "|/-\\"
    }

putPlain :: Text -> Text -> Text -> IO ()
putPlain scope section msg = TIO.putStrLn (plainLine scope section msg)

putInfo :: UI -> Text -> IO ()
putInfo ui msg = TIO.putStrLn (style ui OrangeBold msg)

putSuccess :: UI -> Text -> IO ()
putSuccess ui msg = TIO.putStrLn (style ui Green (T.singleton (symSuccess (uiSymbols ui)) <> " " <> msg))

putErrorLine :: UI -> Text -> IO ()
putErrorLine ui msg = TIO.putStrLn (style ui Red (T.singleton (symError (uiSymbols ui)) <> " " <> msg))

putDim :: UI -> Text -> IO ()
putDim ui msg = TIO.putStrLn (style ui Dim msg)

data AnsiStyle = PlainStyle | Green | Red | Yellow | Dim | Gray | OrangeBold

style :: UI -> AnsiStyle -> Text -> Text
style ui ansi msg
  | not (uiUseColor ui) = msg
  | otherwise = prefix <> msg <> "\ESC[0m"
  where
    prefix = case ansi of
      PlainStyle -> ""
      Green -> "\ESC[32m"
      Red -> "\ESC[31m"
      Yellow -> "\ESC[33m"
      Dim -> "\ESC[2m"
      Gray -> "\ESC[38;2;159;159;159m"
      OrangeBold -> "\ESC[1;38;2;255;161;22m"

classifyException :: SomeException -> Text
classifyException exc
  | "timed out" `isInfixOf` lowered = "network timeout"
  | "timeout" `isInfixOf` lowered = "network timeout"
  | "invalid" `isInfixOf` lowered && "archive" `isInfixOf` lowered = "invalid or incomplete archive"
  | "permission" `isInfixOf` lowered = "permission denied"
  | "could not open file for write" `isInfixOf` lowered = "permission denied"
  | "space" `isInfixOf` lowered && "disk" `isInfixOf` lowered = "disk full"
  | "403" `isInfixOf` lowered = "http 403"
  | "404" `isInfixOf` lowered = "http 404"
  | "500" `isInfixOf` lowered = "http 500"
  | otherwise = sanitizeSingleLine raw
  where
    raw = T.pack (displayException exc)
    lowered = map toLower (T.unpack raw)

sanitizeSingleLine :: Text -> Text
sanitizeSingleLine = T.takeWhile (/= '\n')

supportsRichPrompt :: UI -> Bool
supportsRichPrompt ui = uiMode ui == Rich

startChecklist :: UI -> Text -> [ChecklistStep] -> IO (Maybe Checklist)
startChecklist ui header steps =
  if uiMode ui /= Rich
    then pure Nothing
    else do
      stepsRef <- newIORef steps
      frameRef <- newIORef 0
      renderedRef <- newIORef False
      stopRef <- newIORef False
      renderLock <- newMVar ()
      let mkChecklist =
            Checklist
              { clUI = ui,
                clHeader = header,
                clStepsRef = stepsRef,
                clFrameRef = frameRef,
                clRenderedRef = renderedRef,
                clStopRef = stopRef,
                clRenderLock = renderLock
              }
      let initialChecklist = mkChecklist
      renderChecklist initialChecklist
      _ <- forkIO (spinnerLoop initialChecklist)
      pure (Just mkChecklist)

updateChecklistStep :: Checklist -> Int -> StepStatus -> Text -> IO ()
updateChecklistStep checklist idx newStatus newText =
  withMVar (clRenderLock checklist) $ \_ -> do
    modifyIORef' (clStepsRef checklist) (updateAt idx (\s -> s {csStatus = newStatus, csText = newText}))
    _ <- atomicModifyIORef' (clFrameRef checklist) (\n -> let n' = n + 1 in (n', n'))
    rendered <- readIORef (clRenderedRef checklist)
    if rendered
      then renderChecklistLineLocked checklist idx
      else renderChecklistLocked checklist

stopChecklist :: Checklist -> IO ()
stopChecklist checklist = do
  writeIORef (clStopRef checklist) True
  withMVar (clRenderLock checklist) $ \_ -> moveCursorToChecklistBottom checklist

failActiveChecklistStep :: Checklist -> IO ()
failActiveChecklistStep checklist =
  withMVar (clRenderLock checklist) $ \_ -> do
    steps <- readIORef (clStepsRef checklist)
    case activeStepIndex steps of
      Nothing -> pure ()
      Just idx -> do
        modifyIORef' (clStepsRef checklist) (updateAt idx (\s -> s {csStatus = StepFailed}))
        renderChecklistLineLocked checklist idx

spinnerLoop :: Checklist -> IO ()
spinnerLoop checklist = loop
  where
    loop = do
      stopped <- readIORef (clStopRef checklist)
      unless stopped $ do
        withMVar (clRenderLock checklist) $ \_ -> do
          steps <- readIORef (clStepsRef checklist)
          when (any ((== StepActive) . csStatus) steps) $ do
            _ <- atomicModifyIORef' (clFrameRef checklist) (\n -> let n' = n + 1 in (n', n'))
            for_ (activeStepIndex steps) (renderChecklistLineLocked checklist)
        threadDelay 100000
        loop

renderChecklist :: Checklist -> IO ()
renderChecklist checklist =
  withMVar (clRenderLock checklist) $ \_ -> renderChecklistLocked checklist

renderChecklistLocked :: Checklist -> IO ()
renderChecklistLocked checklist = do
  rendered <- readIORef (clRenderedRef checklist)
  steps <- readIORef (clStepsRef checklist)
  frameIdx <- readIORef (clFrameRef checklist)
  let block = checklistBlock checklist steps frameIdx
  if rendered
    then TIO.putStr (cursorUp (length steps + 1))
    else writeIORef (clRenderedRef checklist) True
  TIO.putStr block
  hFlush stdout

renderChecklistLineLocked :: Checklist -> Int -> IO ()
renderChecklistLineLocked checklist idx = do
  steps <- readIORef (clStepsRef checklist)
  frameIdx <- readIORef (clFrameRef checklist)
  case safeIndex idx steps of
    Nothing -> pure ()
    Just step -> do
      let total = length steps
      TIO.putStr (cursorUp (total - idx))
      TIO.putStr (clearLine (renderStepText (clUI checklist) frameIdx step))
      TIO.putStr (cursorDown (total - idx))
      TIO.putStr "\r"
      hFlush stdout

moveCursorToChecklistBottom :: Checklist -> IO ()
moveCursorToChecklistBottom checklist = do
  steps <- readIORef (clStepsRef checklist)
  TIO.putStr (cursorDown (length steps))
  TIO.putStr "\r"
  hFlush stdout

checklistBlock :: Checklist -> [ChecklistStep] -> Int -> Text
checklistBlock checklist steps frameIdx =
  T.unlines (clearLine (style ui OrangeBold header) : map renderStep steps)
  where
    ui = clUI checklist
    header = clHeader checklist
    renderStep step = clearLine (renderStepText ui frameIdx step)

renderStepText :: UI -> Int -> ChecklistStep -> Text
renderStepText ui frameIdx step =
  "  "
    <> style ui (markerStyle (csStatus step)) (T.singleton (markerChar ui frameIdx (csStatus step)))
    <> " "
    <> csText step

activeStepIndex :: [ChecklistStep] -> Maybe Int
activeStepIndex = go 0
  where
    go _ [] = Nothing
    go n (x : xs)
      | csStatus x == StepActive = Just n
      | otherwise = go (n + 1) xs

markerChar :: UI -> Int -> StepStatus -> Char
markerChar ui frameIdx = \case
  StepPending -> symPending symbols
  StepActive -> frames !! (frameIdx `mod` length frames)
  StepDone -> symSuccess symbols
  StepFailed -> symError symbols
  where
    symbols = uiSymbols ui
    frames = symSpinnerFrames symbols

markerStyle :: StepStatus -> AnsiStyle
markerStyle = \case
  StepDone -> Green
  StepFailed -> Red
  StepActive -> Dim
  StepPending -> Dim

updateAt :: Int -> (a -> a) -> [a] -> [a]
updateAt idx f xs =
  [if i == idx then f x else x | (i, x) <- zip [0 ..] xs]

safeIndex :: Int -> [a] -> Maybe a
safeIndex idx xs
  | idx < 0 = Nothing
  | otherwise =
      case drop idx xs of
        (x : _) -> Just x
        [] -> Nothing

cursorUp :: Int -> Text
cursorUp n = "\ESC[" <> T.pack (show n) <> "A"

cursorDown :: Int -> Text
cursorDown n = "\ESC[" <> T.pack (show n) <> "B"

clearLine :: Text -> Text
clearLine line = "\ESC[2K\r" <> line

stopMaybeChecklist :: Maybe Checklist -> IO ()
stopMaybeChecklist Nothing = pure ()
stopMaybeChecklist (Just checklist) = stopChecklist checklist

emitConfigWarning :: UI -> ConfigLoadResult -> IO ()
emitConfigWarning ui result = case clrWarning result of
  Nothing -> pure ()
  Just warn ->
    case uiMode ui of
      Rich -> do
        TIO.putStrLn "Warning: could not parse config file, using defaults."
        TIO.putStrLn ("Details: " <> sanitizeSingleLine warn)
      Plain -> do
        putPlain "config" "warning" "could not parse config file, using defaults."
        putPlain "config" "warning" ("Details: " <> sanitizeSingleLine warn)
