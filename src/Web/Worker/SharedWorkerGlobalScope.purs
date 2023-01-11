module Web.Worker.SharedWorkerGlobalScope
  ( close
  , name
  , onConnect
  , module GlobalScope
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, mkEffectFn1, runEffectFn1)
import Web.Event.Event (Event)
import Web.Worker.GlobalScope (importScripts, location, navigator, onError, onLanguageChange, onOffline, onOnline, onRejectionHandled, onUnhandledRejection) as GlobalScope

foreign import name :: Effect String

-- | upon calling close, any queued tasks present in the event loop are discarded and the web worker scope is closed.
foreign import close :: Effect Unit

onConnect :: (Event -> Effect Unit) -> Effect Unit
onConnect cb = runEffectFn1 onConnectImpl (mkEffectFn1 cb)

foreign import onConnectImpl :: EffectFn1 (EffectFn1 Event Unit) Unit
