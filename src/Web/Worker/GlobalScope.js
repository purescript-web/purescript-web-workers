/* @globals self */

export function importScripts (urls) {
  return function () {
    self.importScripts(...urls);
  }
}

export function location() {
  return self.location;
}

export function navigator() {
  return self.navigator;
}

export function onError(f) {
  return function () {
    self.onerror = function (ev) {
      f(ev)();
    };
  };
}

export function onLanguageChange(f) {
  return function () {
    self.onlanguagechange = function (ev) {
      f(ev)();
    };
  };
}

export function onOffline(f) {
  return function () {
    self.onoffline = function (ev) {
      f(ev)();
    };
  };
}

export function onOnline(f) {
  return function () {
    self.ononline = function (ev) {
      f(ev)();
    };
  };
}

export function onRejectionHandled(f) {
  return function () {
    self.onrejectionhandled = function (ev) {
      f(ev)();
    };
  };
}

export function onUnhandledRejection(f) {
  return function () {
    self.onunhandledrejection = function (ev) {
      f(ev)();
    };
  };
}