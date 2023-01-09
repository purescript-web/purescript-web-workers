module Web.Worker.DedicatedWorkerGlobalScope
  ( close
  , name
  , onMessage
  , onMessageError
  , postMessage
  , postMessage'
  , module GlobalScope
  )
  where

import Prelude
import Effect (Effect)
import Web.Worker.Types (Transferable)
import Web.Worker.MessageEvent (MessageEvent)
import Web.Worker.GlobalScope (importScripts, location, navigator, onError, onLanguageChange, onOffline
                            , onOnline, onRejectionHandled, onUnhandledRejection
                            ) as GlobalScope

foreign import name :: Effect String

foreign import postMessageImpl :: forall msg. msg -> Array Transferable -> Effect Unit

-- | sends a message to the main thread that spawned it.
postMessage :: forall msg. msg -> Effect Unit
postMessage msg = postMessageImpl msg []

postMessage' :: forall msg. msg -> Array Transferable -> Effect Unit
postMessage' = postMessageImpl

-- | upon calling close, any queued tasks present in the event loop are discarded and the web worker scope is closed.
foreign import close :: Effect Unit

-- | fired when the worker receives a message from its parent.
foreign import onMessage :: (MessageEvent -> Effect Unit) -> Effect Unit

-- | fired when a worker receives a message that can't be deserialized.
foreign import onMessageError :: (MessageEvent -> Effect Unit) -> Effect Unit