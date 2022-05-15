module Web.Worker.Event where

import Foreign (Foreign)

foreign import data MessageEvent :: Type

foreign import data_ :: MessageEvent -> Foreign

foreign import origin :: MessageEvent -> String

foreign import lastEventId :: MessageEvent -> String

-- source :: WindwProxy | MessagePort | ServiceWorker
-- ports :: Array MessagePort