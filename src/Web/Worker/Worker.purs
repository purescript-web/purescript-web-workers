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
  ) where

import Prelude
import Data.Maybe (Maybe)
import Effect (Effect)
import Unsafe.Coerce (unsafeCoerce)
import Web.Event.Event (Event)
import Web.Event.EventTarget (EventTarget)
import Web.Internal.FFI (unsafeReadProtoTagged)
import Web.Worker.MessageEvent (MessageEvent)
import Web.Worker.Types (Transferable)
import Web.Worker.Options (WorkerOptions, toJsOptions)

foreign import data Worker :: Type

fromEventTarget :: EventTarget -> Maybe Worker
fromEventTarget = unsafeReadProtoTagged "Worker"

toEventTarget :: Worker -> EventTarget
toEventTarget = unsafeCoerce

foreign import _new :: String -> { name :: String, credentials :: String, type :: String } -> Effect Worker

-- | creates a worker object that executes the script at the specified URL. 
new :: String -> WorkerOptions -> Effect Worker
new url options = _new url (toJsOptions options)

foreign import postMessageImpl :: forall msg. msg -> Array Transferable -> Worker -> Effect Unit

-- | sends a message to the worker's inner scope. 
postMessage :: forall msg. msg -> Worker -> Effect Unit
postMessage msg = postMessageImpl msg []

postMessage' :: forall msg. msg -> Array Transferable -> Worker -> Effect Unit
postMessage' = postMessageImpl

-- | immediately terminates the worker.
-- | This does not offer the worker an opportunity to finish its operations; it is stopped at once.
foreign import terminate :: Worker -> Effect Unit

-- | fired when the worker's parent receives a message from its worker
foreign import onMessage :: (MessageEvent -> Effect Unit) -> Worker -> Effect Unit

-- | fired when the worker's parent receives a message that can't be deserialized.
foreign import onMessageError :: (MessageEvent -> Effect Unit) -> Worker -> Effect Unit

-- | fired when an error occurs in the worker.
foreign import onError :: (Event -> Effect Unit) -> Worker -> Effect Unit
