module Web.Worker.MessageEvent
  ( fromEvent
  , toEvent
  , data_
  , lastEventId
  , origin
  , module Types
  )
  where

import Data.Maybe (Maybe)
import Foreign (Foreign)
import Web.Event.Event (Event)
import Web.Internal.FFI (unsafeReadProtoTagged)
import Web.Worker.Types (MessageEvent) as Types
import Web.Worker.Types (MessageEvent, MessagePort)
import Unsafe.Coerce (unsafeCoerce)

fromEvent :: Event -> Maybe MessageEvent
fromEvent = unsafeReadProtoTagged "MessageEvent"

toEvent :: MessageEvent -> Event
toEvent = unsafeCoerce

foreign import data_ :: MessageEvent -> Foreign

foreign import origin :: MessageEvent -> String

foreign import lastEventId :: MessageEvent -> String

foreign import ports :: MessageEvent -> Array MessagePort
