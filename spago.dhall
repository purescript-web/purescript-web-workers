{ name = "web-workers"
, dependencies =
  [ "effect"
  , "foreign"
  , "functions"
  , "maybe"
  , "newtype"
  , "prelude"
  , "unsafe-coerce"
  , "web-events"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
