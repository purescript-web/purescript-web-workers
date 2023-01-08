-- | This module contains functions that can be called by any worker thread.

module Web.Worker.GlobalScope
  ( close
  , location
  , navigator
  , onError
  , onMessage
  , onMessageError
  , postMessage
  , postMessage'
  ) where

import Prelude
import Effect (Effect)
import Web.Worker.Navigator (Navigator)
import Web.Worker.Location (Location)
import Web.Event.Event (Event)
import Web.Worker.MessageEvent (MessageEvent)
import Web.Worker.Types (Transferable)

foreign import location :: Effect Location

foreign import navigator :: Effect Navigator

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

-- |  fired when an error occurs in the worker
foreign import onError :: (Event -> Effect Unit) -> Effect Unit
