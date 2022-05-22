# purescript-web-workers

Type definitions and low level interface implementations for the [W3C Web Workers API](https://html.spec.whatwg.org/multipage/workers.html).

### Install

```
spago install web-workers
```

### Documentation

[Published on Pursuit](https://pursuit.purescript.org/packages/purescript-web-workers/)

### Example

code for the worker

```purescript
module Test.Worker where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Control.Monad.Except (runExcept)
import Foreign (readInt)
import Web.Worker.GlobalScope (postMessage, onMessage)
import Web.Worker.MessageEvent (data_)
import Effect.Console (log)

main :: Effect Unit
main = do
  onMessage \ev -> do
    case runExcept $ readInt $ data_ ev of
      Left _ -> log "Sent data is not an integer"
      Right n -> postMessage $ n * n
```


main code

```purescript
module Main where

import Prelude
import Data.Either (Either(..))
import Control.Monad.Except (runExcept)
import Foreign (readInt)
import Effect (Effect)
import Effect.Console (log)
import Web.Worker.Worker (defaultWorkerOptions, new, postMessage, onMessage)
import Web.Worker.MessageEvent (data_)

main :: Effect Unit
main = do
  worker <- new "./worker.js" defaultWorkerOptions
  worker
    # onMessage \ev -> case runExcept $ readInt $ data_ ev of
        Left _ -> log "Received data is not an integer"
        Right n -> log $ "Received integer from worker: " <> show n
  worker # postMessage 4
  worker # postMessage 5
```
