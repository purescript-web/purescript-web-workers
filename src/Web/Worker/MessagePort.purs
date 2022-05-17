module Web.Worker.MessagePort
  ( module Types
  , onMessage
  , onMessageError
  , postMessage
  , postMessage'
  , start
  , close
  )
  where

import Prelude
import Effect (Effect)
import Web.Worker.Types (MessageEvent, MessagePort, Transferable)
import Web.Worker.Types (MessagePort) as Types

foreign import onMessage :: (MessageEvent -> Effect Unit) -> MessagePort -> Effect Unit
foreign import onMessageError :: (MessageEvent -> Effect Unit) -> MessagePort -> Effect Unit

foreign import postMessageImpl :: forall msg. msg -> Array Transferable -> MessagePort -> Effect Unit

postMessage :: forall msg. msg -> MessagePort -> Effect Unit
postMessage msg = postMessageImpl msg []

postMessage' :: forall msg. msg -> Array Transferable -> MessagePort -> Effect Unit
postMessage' = postMessageImpl

foreign import close :: MessagePort -> Effect Unit
foreign import start :: MessagePort -> Effect Unit
