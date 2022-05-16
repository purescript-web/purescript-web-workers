module Web.Worker.MessagePort
  ( close
  , module Types
  , onMessage
  , onMessageError
  )
  where

import Prelude
import Effect (Effect)
import Web.Worker.Types (MessageEvent, MessagePort)
import Web.Worker.Types (MessagePort) as Types

foreign import onMessage :: (MessageEvent -> Effect Unit) -> MessagePort -> Effect Unit
foreign import onMessageError :: (MessageEvent -> Effect Unit) -> MessagePort -> Effect Unit
foreign import close :: MessagePort -> Effect Unit
foreign import start :: MessagePort -> Effect Unit
