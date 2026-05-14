module CLI.Runtime where

import CLI.UI (GlobalOptions, UI, mkUI)

data Runtime = Runtime
  { rtGlobalOptions :: GlobalOptions,
    rtUI :: UI
  }

mkRuntime :: GlobalOptions -> IO Runtime
mkRuntime opts = do
  ui <- mkUI opts
  pure Runtime {rtGlobalOptions = opts, rtUI = ui}
