-- https://developer.mozilla.org/en-US/docs/Web/API/WorkerLocation
module Web.Worker.Location
  ( Location
  , hash
  , host
  , hostname
  , href
  , origin
  , pathname
  , port
  , protocol
  , search
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)

foreign import data Location :: Type

hash :: Location -> Effect String
hash loc = runEffectFn1 hashImpl loc

foreign import hashImpl :: EffectFn1 Location String

host :: Location -> Effect String
host loc = runEffectFn1 hostImpl loc

foreign import hostImpl :: EffectFn1 Location String

hostname :: Location -> Effect String
hostname loc = runEffectFn1 hostnameImpl loc

foreign import hostnameImpl :: EffectFn1 Location String

href :: Location -> Effect String
href loc = runEffectFn1 hrefImpl loc

foreign import hrefImpl :: EffectFn1 Location String

origin :: Location -> Effect String
origin loc = runEffectFn1 originImpl loc

foreign import originImpl :: EffectFn1 Location String

pathname :: Location -> Effect String
pathname loc = runEffectFn1 pathnameImpl loc

foreign import pathnameImpl :: EffectFn1 Location String

port :: Location -> Effect String
port loc = runEffectFn1 portImpl loc

foreign import portImpl :: EffectFn1 Location String

protocol :: Location -> Effect String
protocol loc = runEffectFn1 protocolImpl loc

foreign import protocolImpl :: EffectFn1 Location String

search :: Location -> Effect String
search loc = runEffectFn1 searchImpl loc

foreign import searchImpl :: EffectFn1 Location String
