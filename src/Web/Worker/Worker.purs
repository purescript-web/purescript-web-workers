-- | This module contains function to create and control workers from the parent's worker
module Web.Worker.Worker
  ( Worker
  , fromEventTarget
  , new
  , onMessage
  , onMessageError
  , onError
  , postMessage
  , postMessage'
  , terminate
  , toEventTarget
  , module Options
  ) where

import Prelude

import Data.Maybe (Maybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, mkEffectFn1, runEffectFn1, runEffectFn2, runEffectFn3)
import Unsafe.Coerce (unsafeCoerce)
import Web.Event.Event (Event)
import Web.Event.EventTarget (EventTarget)
import Web.Internal.FFI (unsafeReadProtoTagged)
import Web.Worker.MessageEvent (MessageEvent)
import Web.Worker.Options (WorkerOptions, Credentials(..), WorkerType(..), defaultWorkerOptions) as Options
import Web.Worker.Options (WorkerOptions, toJsOptions)
import Web.Worker.Types (class IsSendable, Transferable)

foreign import data Worker :: Type

fromEventTarget :: EventTarget -> Maybe Worker
fromEventTarget = unsafeReadProtoTagged "Worker"

toEventTarget :: Worker -> EventTarget
toEventTarget = unsafeCoerce

foreign import newImpl :: EffectFn2 String { name :: String, credentials :: String, type :: String } Worker

-- | creates a worker object that executes the script at the specified URL. 
new :: String -> WorkerOptions -> Effect Worker
new url options = runEffectFn2 newImpl url (toJsOptions options)

foreign import postMessageImpl :: forall msg. EffectFn3 Worker msg (Array Transferable) Unit

-- | sends a message to the worker's inner scope. 
postMessage :: forall msg. IsSendable msg => msg -> Worker -> Effect Unit
postMessage msg worker = postMessage' msg [] worker

postMessage' :: forall msg. IsSendable msg => msg -> Array Transferable -> Worker -> Effect Unit
postMessage' msg tr worker = runEffectFn3 postMessageImpl worker msg tr

-- | immediately terminates the worker.
-- | This does not offer the worker an opportunity to finish its operations; it is stopped at once.
terminate :: Worker -> Effect Unit
terminate worker = runEffectFn1 terminateImpl worker

foreign import terminateImpl :: EffectFn1 Worker Unit

-- | fired when the worker's parent receives a message from its worker
onMessage :: (MessageEvent -> Effect Unit) -> Worker -> Effect Unit
onMessage cb worker = runEffectFn2 onMessageImpl worker (mkEffectFn1 cb)

foreign import onMessageImpl :: EffectFn2 Worker (EffectFn1 MessageEvent Unit) Unit

-- | fired when the worker's parent receives a message that can't be deserialized.
onMessageError :: (MessageEvent -> Effect Unit) -> Worker -> Effect Unit
onMessageError cb worker = runEffectFn2 onMessageErrorImpl worker (mkEffectFn1 cb)

foreign import onMessageErrorImpl :: EffectFn2 Worker (EffectFn1 MessageEvent Unit) Unit

-- | fired when an error occurs in the worker.
onError :: (Event -> Effect Unit) -> Worker -> Effect Unit
onError cb worker = runEffectFn2 onErrorImpl worker (mkEffectFn1 cb)

foreign import onErrorImpl :: EffectFn2 Worker (EffectFn1 Event Unit) Unit
