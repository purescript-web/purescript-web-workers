module Web.Worker.Options
  ( Credentials(..)
  , WorkerOptions
  , WorkerType(..)
  , defaultWorkerOptions
  , toJsOptions
  ) where

import Prelude

data WorkerType
  = Classic
  | Module Credentials

data Credentials
  = Omit
  | SameOrigin
  | Include

type WorkerOptions =
  { name :: String
  , type :: WorkerType
  }

defaultWorkerOptions :: WorkerOptions
defaultWorkerOptions =
  { name: ""
  , type: Classic
  }

printCredentials :: Credentials -> String
printCredentials = case _ of
  Omit -> "omit"
  SameOrigin -> "same-origin"
  Include -> "include"

instance Show Credentials where
  show = case _ of
    Omit -> "Omit"
    SameOrigin -> "SameOrigin"
    Include -> "Include"

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
    , credentials: printCredentials credentials
    }
