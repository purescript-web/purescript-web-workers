# Changelog

Notable changes to this project are documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Breaking changes:
- The data argument of functions `postMessage` and `postMessage'` must be instance of a new typeclass `isSendable`  
- Refactored `Worker` to better match the spec
- Refactored `Credentials`' `Show` instance to be more `Show`-like; use `printCredentials` now

New features:
- Added `SharedWorker` bindings
- Added `Show` instance to `WorkerType`

Bugfixes:

Other improvements:
- Added documentation
- Migrated from `pulp`/`bower` to `spago`
- Updated FFI to use `EffectFnX` types
- Added CI and GitHub issue/pr templates
- Added `purs-tidy` formatter to CI

## [v1.1.0](https://github.com/purescript-web/purescript-web-workers/releases/tag/v1.1.0) - 2022-05-2

- purty and export MessageEvent.ports
- 
## [v1.0.0](https://github.com/purescript-web/purescript-web-workers/releases/tag/v1.0.0) - 2022-05-17

- Update README.md

## [v0.2.0](https://github.com/purescript-web/purescript-web-workers/releases/tag/v0.2.0) - 2022-05-16

Update `bower.json`

## [v0.1.0](https://github.com/purescript-web/purescript-web-workers/releases/tag/v0.1.0) - 2022-05-16

- Initial release
