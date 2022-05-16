-- https://developer.mozilla.org/en-US/docs/Web/API/WorkerNavigator
module Web.Worker.GlobalScope
  ( close
  , location
  , navigator
  , onError
  , onMessage
  , onMessageError
  , postMessage
  ) where

import Prelude
import Effect (Effect)
import Web.Worker.Navigator (Navigator)
import Web.Worker.Location (Location)
import Web.Event.Event (Event)
import Web.Worker.Event (MessageEvent)

foreign import location :: Effect Location

foreign import navigator :: Effect Navigator

foreign import postMessage :: forall msg. msg -> Effect Unit

foreign import close :: Effect Unit

foreign import onMessage :: (MessageEvent -> Effect Unit) -> Effect Unit

foreign import onMessageError :: (MessageEvent -> Effect Unit) -> Effect Unit

foreign import onError :: (Event -> Effect Unit) -> Effect Unit
