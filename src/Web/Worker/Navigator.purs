-- https://developer.mozilla.org/en-US/docs/Web/API/WorkerNavigator

module Web.Worker.Navigator
  ( Navigator
  , hardwareConcurrency
  , language
  , languages
  , onLine
  , userAgent
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)

foreign import data Navigator :: Type

language :: Navigator -> Effect String
language nav = runEffectFn1 languageImpl nav

foreign import languageImpl :: EffectFn1 Navigator String

languages :: Navigator -> Effect (Array String)
languages nav = runEffectFn1 languagesImpl nav

foreign import languagesImpl :: EffectFn1 Navigator (Array String)

hardwareConcurrency :: Navigator -> Effect Int
hardwareConcurrency nav = runEffectFn1 hardwareConcurrencyImpl nav

foreign import hardwareConcurrencyImpl :: EffectFn1 Navigator Int

onLine :: Navigator -> Effect Boolean
onLine nav = runEffectFn1 onLineImpl nav

foreign import onLineImpl :: EffectFn1 Navigator Boolean

userAgent :: Navigator -> Effect String
userAgent nav = runEffectFn1 userAgentImpl nav

foreign import userAgentImpl :: EffectFn1 Navigator String

-- todo: complete the list of attributes
