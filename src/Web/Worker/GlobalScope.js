/* @globals self */

export function importScriptsImpl(urls) {
  self.importScripts(...urls);
}

export function location() {
  return self.location;
}

export function navigator() {
  return self.navigator;
}

export function onErrorImpl(f) {
  self.onerror = f;
}

export function onLanguageChangeImpl(f) {
  self.onlanguagechange = f;
}

export function onOfflineImpl(f) {
  self.onoffline = f;
}

export function onOnlineImpl(f) {
  self.ononline = f;
}

export function onRejectionHandledImpl(f) {
  self.onrejectionhandled = f;
}

export function onUnhandledRejectionImpl(f) {
  self.onunhandledrejection = f;
}
