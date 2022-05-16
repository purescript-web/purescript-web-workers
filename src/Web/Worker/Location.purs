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

foreign import data Location :: Type

foreign import hash :: Location -> Effect String

foreign import host :: Location -> Effect String

foreign import hostname :: Location -> Effect String

foreign import href :: Location -> Effect String

foreign import origin :: Location -> Effect String

foreign import pathname :: Location -> Effect String

foreign import port :: Location -> Effect String

foreign import protocol :: Location -> Effect String

foreign import search :: Location -> Effect String
