-- https://developer.mozilla.org/en-US/docs/Web/API/WorkerNavigator

module Web.Worker.GlobalScope where

import Prelude
import Effect (Effect)
import Web.Worker.Navigator (Navigator)
import Web.Worker.Location (Location)

foreign import location :: Effect Location

foreign import navigator :: Effect Navigator

foreign import postMessage :: forall msg. msg -> Effect Unit

foreign import close :: Effect Unit