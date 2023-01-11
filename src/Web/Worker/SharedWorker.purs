module Web.Worker.SharedWorker
  ( SharedWorker
  , fromEventTarget
  , new
  , onError
  , port
  , toEventTarget
  , module Options
  ) where

import Prelude

import Data.Maybe (Maybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, mkEffectFn1, runEffectFn1, runEffectFn2)
import Unsafe.Coerce (unsafeCoerce)
import Web.Event.Event (Event)
import Web.Event.EventTarget (EventTarget)
import Web.Internal.FFI (unsafeReadProtoTagged)
import Web.Worker.Options (WorkerOptions, Credentials(..), WorkerType(..), defaultWorkerOptions) as Options
import Web.Worker.Options (WorkerOptions, toJsOptions)
import Web.Worker.Types (MessagePort)

foreign import data SharedWorker :: Type

foreign import newImpl :: EffectFn2 String { name :: String, credentials :: String, type :: String } SharedWorker

-- | creates a worker object that executes the script at the specified URL. 
new :: String -> WorkerOptions -> Effect SharedWorker
new url options = runEffectFn2 newImpl url (toJsOptions options)

fromEventTarget :: EventTarget -> Maybe SharedWorker
fromEventTarget = unsafeReadProtoTagged "SharedWorker"

toEventTarget :: SharedWorker -> EventTarget
toEventTarget = unsafeCoerce

port :: SharedWorker -> Effect MessagePort
port worker = runEffectFn1 portImpl worker

foreign import portImpl :: EffectFn1 SharedWorker MessagePort

-- | fired when an error occurs in the worker.
onError :: (Event -> Effect Unit) -> SharedWorker -> Effect Unit
onError cb worker = runEffectFn2 onErrorImpl worker (mkEffectFn1 cb)

foreign import onErrorImpl :: EffectFn2 SharedWorker (EffectFn1 Event Unit) Unit
