-- https://developer.mozilla.org/en-US/docs/Web/API/WorkerNavigator

module Web.Worker.Navigator
  ( Navigator
  , hardwareConcurrency
  , language
  , languages
  , onLine
  , userAgent
  )
  where

import Effect (Effect)

foreign import data Navigator :: Type

foreign import language :: Navigator -> Effect String

foreign import languages :: Navigator -> Effect (Array String)

foreign import hardwareConcurrency :: Navigator -> Effect Int

foreign import onLine :: Navigator -> Effect Boolean

foreign import userAgent :: Navigator -> Effect String


-- todo: complete the list of attributes