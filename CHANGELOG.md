# Changelog

Notable changes to this project are documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Breaking changes:

New features:

Bugfixes:

Other improvements:

## [v2.0.1](https://github.com/purescript-web/purescript-web-workers/releases/tag/v2.0.1) - 2026-10-10

Other improvements:
- Migrated from Spago Dhall to registry-backed Spago and updated PureScript, CI, and development tooling with Oxlint, Oxfmt, and purs-tidy (#8 by @thomashoneyman).

## [v2.0.0](https://github.com/purescript-web/purescript-web-workers/releases/tag/v2.0.0) - 2023-04-30

Breaking changes:
- The data argument of functions `postMessage` and `postMessage'` must be instance of a new typeclass `IsSendable` (#5 by @gbagan)
- Refactored `Worker` to better match the spec
- Refactored `Credentials`' `Show` instance to be more `Show`-like; use `printCredentials` now (#3 by @JordanMartinez)

New features:
- Added `SharedWorker` bindings
- Added `Show` instance to `WorkerType` (#3 by @JordanMartinez)

Bugfixes:

Other improvements:
- Added documentation
- Migrated from `pulp`/`bower` to `spago`
- Updated FFI to use `EffectFnX` types (#3 by @JordanMartinez)
- Added CI and GitHub issue/pr templates (#3 by @JordanMartinez)
- Added `purs-tidy` formatter to CI (#3 by @JordanMartinez)

## [v1.1.0](https://github.com/purescript-web/purescript-web-workers/releases/tag/v1.1.0) - 2022-05-2

- purty and export MessageEvent.ports
- 
## [v1.0.0](https://github.com/purescript-web/purescript-web-workers/releases/tag/v1.0.0) - 2022-05-17

- Update README.md

## [v0.2.0](https://github.com/purescript-web/purescript-web-workers/releases/tag/v0.2.0) - 2022-05-16

Update `bower.json`

## [v0.1.0](https://github.com/purescript-web/purescript-web-workers/releases/tag/v0.1.0) - 2022-05-16

- Initial release
