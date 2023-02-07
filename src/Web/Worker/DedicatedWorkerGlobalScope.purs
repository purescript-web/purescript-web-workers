module Web.Worker.DedicatedWorkerGlobalScope
  ( close
  , name
  , onMessage
  , onMessageError
  , postMessage
  , postMessage'
  , module GlobalScope
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, mkEffectFn1, runEffectFn1, runEffectFn2)
import Web.Worker.GlobalScope (importScripts, location, navigator, onError, onLanguageChange, onOffline, onOnline, onRejectionHandled, onUnhandledRejection) as GlobalScope
import Web.Worker.MessageEvent (MessageEvent)
import Web.Worker.Types (class IsSendable, Transferable)

foreign import name :: Effect String

-- | sends a message to the main thread that spawned it.
postMessage :: forall msg. IsSendable msg => msg -> Effect Unit
postMessage msg = postMessage' msg []

postMessage' :: forall msg. IsSendable msg => msg -> Array Transferable -> Effect Unit
postMessage' msg tr = runEffectFn2 postMessageImpl msg tr

foreign import postMessageImpl :: forall msg. EffectFn2 msg (Array Transferable) Unit

-- | upon calling close, any queued tasks present in the event loop are discarded and the web worker scope is closed.
foreign import close :: Effect Unit

-- | fired when the worker receives a message from its parent.
onMessage :: (MessageEvent -> Effect Unit) -> Effect Unit
onMessage cb = runEffectFn1 onMessageImpl (mkEffectFn1 cb)

foreign import onMessageImpl :: EffectFn1 (EffectFn1 MessageEvent Unit) Unit

-- | fired when a worker receives a message that can't be deserialized.
onMessageError :: (MessageEvent -> Effect Unit) -> Effect Unit
onMessageError cb = runEffectFn1 onMessageErrorImpl (mkEffectFn1 cb)

foreign import onMessageErrorImpl :: EffectFn1 (EffectFn1 MessageEvent Unit) Unit
