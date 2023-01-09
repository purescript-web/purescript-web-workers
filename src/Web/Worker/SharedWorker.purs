module Web.Worker.SharedWorker
  ( SharedWorker
  , fromEventTarget
  , new
  , onError
  , port
  , toEventTarget
  )
  where

import Prelude
import Data.Maybe (Maybe)
import Effect (Effect)
import Unsafe.Coerce (unsafeCoerce)
import Web.Worker.Options (WorkerOptions, toJsOptions)
import Web.Worker.Types (MessagePort)
import Web.Event.Event (Event)
import Web.Event.EventTarget (EventTarget)
import Web.Internal.FFI (unsafeReadProtoTagged)

foreign import data SharedWorker :: Type

foreign import _new :: String -> { name :: String, credentials :: String, type :: String } -> Effect SharedWorker

-- | creates a worker object that executes the script at the specified URL. 
new :: String -> WorkerOptions -> Effect SharedWorker
new url options = _new url (toJsOptions options)

fromEventTarget :: EventTarget -> Maybe SharedWorker
fromEventTarget = unsafeReadProtoTagged "SharedWorker"

toEventTarget :: SharedWorker -> EventTarget
toEventTarget = unsafeCoerce

foreign import port :: SharedWorker -> Effect MessagePort

-- | fired when an error occurs in the worker.
foreign import onError :: (Event -> Effect Unit) -> SharedWorker -> Effect Unit
