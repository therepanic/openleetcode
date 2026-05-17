module CLISpec where

import CLI.Commands
import CLI.Config (ConfigOpts (ConfigSet), configKey, configValue)
import CLI.Download (DownloadTarget (Runtimes, Tests), parseTarget)
import CLI.Submit
import CLI.SubmitPipeline (SubmitFailure (SubmitMissingSelector))
import CLI.UI (ColorMode (ColorAuto), GlobalOptions (goColorMode, goNoColor, goPlain), plainLine, sanitizeSingleLine)
import Core.Types (Language (Python3))
import Options.Applicative
import Test.Hspec

spec :: Spec
spec = do
  describe "CLI.Download.parseTarget" $ do
    it "parses runtimes target" $
      parseTarget "runtimes" `shouldBe` Right Runtimes

    it "parses tests target" $
      parseTarget "tests" `shouldBe` Right Tests

    it "returns normalized parser error for invalid target" $
      parseTarget "foo" `shouldBe` Left "Invalid download target: 'foo' (expected: all, runtimes, tests)"

  describe "CLI.Submit.validateSubmit" $ do
    it "requires either id or title" $
      validateSubmit (SubmitOpts "solution.py" Nothing Nothing Nothing) `shouldBe` Just SubmitMissingSelector

    it "accepts id selector" $
      validateSubmit (SubmitOpts "solution.py" (Just 1) Nothing Nothing) `shouldBe` Nothing

    it "accepts title selector" $
      validateSubmit (SubmitOpts "solution.py" Nothing (Just "two-sum") Nothing) `shouldBe` Nothing

    it "allows both selectors and lets id win later" $
      validateSubmit (SubmitOpts "solution.py" (Just 1) (Just "two-sum") (Just Python3)) `shouldBe` Nothing

  describe "CLI.Submit helpers" $ do
    it "strips oracle execution prefix from internal judge messages" $
      stripOracleExecutionPrefix "Oracle execution error: boom"
        `shouldBe` "boom"

    it "leaves non-oracle messages unchanged" $
      stripOracleExecutionPrefix "plain failure"
        `shouldBe` "plain failure"

    it "detects oracle execution messages" $
      isOracleExecutionMessage "Oracle execution error: boom"
        `shouldBe` True

  describe "CLI.UI helpers" $ do
    it "formats plain output with scope and section" $
      plainLine "submit" "preparing" "load configuration"
        `shouldBe` "openleetcode: submit: preparing: load configuration"

    it "keeps plain output compact without multiline tails" $
      sanitizeSingleLine "line1\nline2" `shouldBe` "line1"

    it "formats plain output without section" $
      plainLine "config" "" "backend.url updated"
        `shouldBe` "openleetcode: config: backend.url updated"

  describe "CLI.Commands parser" $ do
    it "parses explicit submit command with id" $
      isParsedSubmitWithId (parseCli ["submit", "solution.py", "--id", "1"])
        `shouldBe` True

    it "parses global plain flag before command" $
      isParsedPlainSubmit (parseCli ["--plain", "submit", "solution.py", "--id", "1"])
        `shouldBe` True

    it "parses config set command" $
      isParsedConfigSet (parseCli ["config", "set", "backend.url", "http://localhost:2000"])
        `shouldBe` True

parseCli :: [String] -> ParserResult CliOptions
parseCli =
  execParserPure defaultPrefs (info (cliOptionsParser <**> helper) mempty)

isParsedSubmitWithId :: ParserResult CliOptions -> Bool
isParsedSubmitWithId (Success opts) =
  case cliCommand opts of
    Submit submitOpts -> submitPath submitOpts == "solution.py" && submitId submitOpts == Just 1
    _ -> False
isParsedSubmitWithId _ = False

isParsedPlainSubmit :: ParserResult CliOptions -> Bool
isParsedPlainSubmit (Success opts) =
  goPlain (cliGlobalOptions opts)
    && not (goNoColor (cliGlobalOptions opts))
    && goColorMode (cliGlobalOptions opts) == ColorAuto
    && case cliCommand opts of
      Submit submitOpts -> submitPath submitOpts == "solution.py" && submitId submitOpts == Just 1
      _ -> False
isParsedPlainSubmit _ = False

isParsedConfigSet :: ParserResult CliOptions -> Bool
isParsedConfigSet (Success opts) =
  case cliCommand opts of
    Config (ConfigSet setOpts) ->
      configKey setOpts == "backend.url"
        && configValue setOpts == "http://localhost:2000"
    _ -> False
isParsedConfigSet _ = False
