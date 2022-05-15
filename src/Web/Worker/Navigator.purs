-- https://developer.mozilla.org/en-US/docs/Web/API/WorkerNavigator

module Web.Worker.Navigator where

import Effect (Effect)

foreign import data Navigator :: Type

foreign import language :: Navigator -> Effect String

foreign import hardwareConcurrency :: Navigator -> Effect Int

foreign import onLine :: Navigator -> Effect Boolean

-- connection