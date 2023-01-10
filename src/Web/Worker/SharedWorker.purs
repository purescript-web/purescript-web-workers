module Web.Worker.SharedWorker
  ( SharedWorker
  , fromEventTarget
  , new
  , onError
  , port
  , toEventTarget
  , module Options
  )
  where

import Prelude

import Data.Maybe (Maybe)
import Effect (Effect)
import Unsafe.Coerce (unsafeCoerce)
import Web.Event.Event (Event)
import Web.Event.EventTarget (EventTarget)
import Web.Internal.FFI (unsafeReadProtoTagged)
import Web.Worker.Options (WorkerOptions, Credentials(..),
                          WorkerType(..), defaultWorkerOptions
                          ) as Options
import Web.Worker.Options (WorkerOptions, toJsOptions)
import Web.Worker.Types (MessagePort)

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
