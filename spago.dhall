{ name = "web-workers"
, dependencies =
  [ "effect"
  , "foreign"
  , "functions"
  , "maybe"
  , "prelude"
  , "unsafe-coerce"
  , "web-events"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
