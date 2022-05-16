module Web.Worker.MessageEvent
  ( data_
  , lastEventId
  , origin
  , module Types
  )
  where

import Foreign (Foreign)
import Web.Worker.Types (MessageEvent, MessagePort)
import Web.Worker.Types (MessageEvent) as Types

foreign import data_ :: MessageEvent -> Foreign

foreign import origin :: MessageEvent -> String

foreign import lastEventId :: MessageEvent -> String

foreign import ports :: MessageEvent -> Array MessagePort

-- source :: WindwProxy | MessagePort | ServiceWorker
-- ports :: Array MessagePort