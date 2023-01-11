module Web.Worker.MessagePort
  ( module Types
  , onMessage
  , onMessageError
  , postMessage
  , postMessage'
  , start
  , close
  ) where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, mkEffectFn1, runEffectFn1, runEffectFn2, runEffectFn3)
import Web.Worker.Types (class IsSendable, MessageEvent, MessagePort, Transferable)
import Web.Worker.Types (MessagePort) as Types

onMessage :: (MessageEvent -> Effect Unit) -> MessagePort -> Effect Unit
onMessage cb port = runEffectFn2 onMessageImpl port (mkEffectFn1 cb)

foreign import onMessageImpl :: EffectFn2 MessagePort (EffectFn1 MessageEvent Unit) Unit

onMessageError :: (MessageEvent -> Effect Unit) -> MessagePort -> Effect Unit
onMessageError cb port = runEffectFn2 onMessageErrorImpl port (mkEffectFn1 cb)

foreign import onMessageErrorImpl :: EffectFn2 MessagePort (EffectFn1 MessageEvent Unit) Unit

foreign import postMessageImpl :: forall msg. EffectFn3 MessagePort msg (Array Transferable) Unit

postMessage :: forall msg. IsSendable msg => msg -> MessagePort -> Effect Unit
postMessage msg port = postMessage' msg [] port

postMessage' :: forall msg. IsSendable msg => msg -> Array Transferable -> MessagePort -> Effect Unit
postMessage' msg data_ port = runEffectFn3 postMessageImpl port msg data_

close :: MessagePort -> Effect Unit
close port = runEffectFn1 closeImpl port

foreign import closeImpl :: EffectFn1 MessagePort Unit

start :: MessagePort -> Effect Unit
start port = runEffectFn1 startImpl port

foreign import startImpl :: EffectFn1 MessagePort Unit
