module Web.Worker.Worker
  ( Credentials(..)
  , Worker
  , WorkerOptions
  , WorkerType(..)
  , defaultWorkerOptions
  , fromEventTarget
  , new
  , onMessage
  , onMessageError
  , onError
  , postMessage
  , postMessage'
  , terminate
  , toEventTarget
  )
  where

import Prelude
import Data.Maybe (Maybe)
import Effect (Effect)
import Unsafe.Coerce (unsafeCoerce)
import Web.Event.Event (Event)
import Web.Event.EventTarget (EventTarget)
import Web.Internal.FFI (unsafeReadProtoTagged)
import Web.Worker.MessageEvent (MessageEvent)
import Web.Worker.Types (Transferable)

foreign import data Worker :: Type


fromEventTarget :: EventTarget -> Maybe Worker
fromEventTarget = unsafeReadProtoTagged "Worker"

toEventTarget :: Worker -> EventTarget
toEventTarget = unsafeCoerce

data WorkerType = Classic | Module
data Credentials = Omit | SameOrigin | Include

type WorkerOptions =
  { credentials :: Credentials
  , name :: String
  , type :: WorkerType 
  }

defaultWorkerOptions :: WorkerOptions
defaultWorkerOptions =
  { name: ""
  , credentials: Omit
  , type: Classic
  }

foreign import _new :: String -> { name :: String, credentials :: String, type :: String } -> Effect Worker

new :: String -> WorkerOptions -> Effect Worker
new url {name, type: t, credentials} = _new url
    { name
    , credentials: show credentials
    , type: show t
    }


foreign import postMessageImpl :: forall msg. msg -> Array Transferable -> Worker -> Effect Unit

postMessage :: forall msg. msg -> Worker -> Effect Unit
postMessage msg = postMessageImpl msg []

postMessage' :: forall msg. msg -> Array Transferable -> Worker -> Effect Unit
postMessage' = postMessageImpl

foreign import terminate :: Worker -> Effect Unit

foreign import onMessage :: (MessageEvent -> Effect Unit) -> Worker -> Effect Unit

foreign import onMessageError :: (MessageEvent -> Effect Unit) -> Worker -> Effect Unit

foreign import onError :: (Event -> Effect Unit) -> Worker -> Effect Unit

instance Show WorkerType where
  show = case _ of
    Classic -> "classic"
    Module  -> "module"

instance Show Credentials where
  show = case _ of
    Omit       -> "omit"
    SameOrigin -> "same-origin"
    Include    -> "include"
