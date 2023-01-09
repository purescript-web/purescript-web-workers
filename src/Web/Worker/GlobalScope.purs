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
  )
  where

import Prelude
import Effect (Effect)
import Web.Worker.Navigator (Navigator)
import Web.Worker.Location (Location)
import Web.Event.Event (Event)

foreign import importScripts :: Array String -> Effect Unit

foreign import location :: Effect Location

foreign import navigator :: Effect Navigator

-- |  fired when an error occurs in the worker
foreign import onError :: (Event -> Effect Unit) -> Effect Unit

foreign import onLanguageChange :: (Event -> Effect Unit) -> Effect Unit

foreign import onOffline :: (Event -> Effect Unit) -> Effect Unit

foreign import onOnline :: (Event -> Effect Unit) -> Effect Unit

foreign import onRejectionHandled :: (Event -> Effect Unit) -> Effect Unit

foreign import onUnhandledRejection :: (Event -> Effect Unit) -> Effect Unit