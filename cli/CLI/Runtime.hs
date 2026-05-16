module CLI.Runtime where

import CLI.UI (GlobalOptions, UI, mkUI)

newtype Runtime = Runtime
  { rtUI :: UI
  }

mkRuntime :: GlobalOptions -> IO Runtime
mkRuntime opts = do
  ui <- mkUI opts
  pure Runtime {rtUI = ui}
