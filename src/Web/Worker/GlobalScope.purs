-- | This module contains functions that can be called by any worker thread.
module Web.Worker.GlobalScope
  ( importScripts
  , location
  , navigator
  , onError
  , onLanguageChange
  , onOffline
  , onOnline
  , onRejectionHandled
  , onUnhandledRejection
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, mkEffectFn1, runEffectFn1)
import Web.Event.Event (Event)
import Web.Worker.Location (Location)
import Web.Worker.Navigator (Navigator)

importScripts :: Array String -> Effect Unit
importScripts arr = runEffectFn1 importScriptsImpl arr

foreign import importScriptsImpl :: EffectFn1 (Array String) Unit

foreign import location :: Effect Location

foreign import navigator :: Effect Navigator

-- |  fired when an error occurs in the worker
onError :: (Event -> Effect Unit) -> Effect Unit
onError cb = runEffectFn1 onErrorImpl (mkEffectFn1 cb)

foreign import onErrorImpl :: EffectFn1 (EffectFn1 Event Unit) Unit

onLanguageChange :: (Event -> Effect Unit) -> Effect Unit
onLanguageChange cb = runEffectFn1 onLanguageChangeImpl (mkEffectFn1 cb)

foreign import onLanguageChangeImpl :: EffectFn1 (EffectFn1 Event Unit) Unit

onOffline :: (Event -> Effect Unit) -> Effect Unit
onOffline cb = runEffectFn1 onOfflineImpl (mkEffectFn1 cb)

foreign import onOfflineImpl :: EffectFn1 (EffectFn1 Event Unit) Unit

onOnline :: (Event -> Effect Unit) -> Effect Unit
onOnline cb = runEffectFn1 onOnlineImpl (mkEffectFn1 cb)

foreign import onOnlineImpl :: EffectFn1 (EffectFn1 Event Unit) Unit

onRejectionHandled :: (Event -> Effect Unit) -> Effect Unit
onRejectionHandled cb = runEffectFn1 onRejectionHandledImpl (mkEffectFn1 cb)

foreign import onRejectionHandledImpl :: EffectFn1 (EffectFn1 Event Unit) Unit

onUnhandledRejection :: (Event -> Effect Unit) -> Effect Unit
onUnhandledRejection cb = runEffectFn1 onUnhandledRejectionImpl (mkEffectFn1 cb)

foreign import onUnhandledRejectionImpl :: EffectFn1 (EffectFn1 Event Unit) Unit
