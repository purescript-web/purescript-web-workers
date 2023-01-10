module Web.Worker.Options
  ( Credentials(..)
  , WorkerOptions
  , WorkerType(..)
  , defaultWorkerOptions
  , toJsOptions
  )
  where

import Prelude

data WorkerType
  = Classic
  | Module Credentials

data Credentials
  = Omit
  | SameOrigin
  | Include

type WorkerOptions
  = { name :: String
    , type :: WorkerType
    }

defaultWorkerOptions :: WorkerOptions
defaultWorkerOptions =
  { name: ""
  , type: Classic
  }

instance Show Credentials where
  show = case _ of
    Omit       -> "omit"
    SameOrigin -> "same-origin"
    Include    -> "include"

toJsOptions :: WorkerOptions -> { name :: String, credentials :: String, type :: String }
toJsOptions { name, type: t } = case t of
  Classic -> 
    { name
    , type: "classic"
    , credentials: "same-origin"
    }
  Module credentials ->
    { name
    , type: "module"
    , credentials: show credentials
    }