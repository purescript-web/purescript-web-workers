module Web.Worker.SharedWorkerGlobalScope
  ( close
  , name
  , onConnect
  , module GlobalScope
  )
  where

import Prelude
import Effect (Effect)
import Web.Event.Event (Event)
import Web.Worker.GlobalScope (importScripts, location, navigator, onError, onLanguageChange, onOffline
                            , onOnline, onRejectionHandled, onUnhandledRejection
                            ) as GlobalScope

foreign import name :: Effect String

-- | upon calling close, any queued tasks present in the event loop are discarded and the web worker scope is closed.
foreign import close :: Effect Unit

foreign import onConnect :: (Event -> Effect Unit) -> Effect Unit