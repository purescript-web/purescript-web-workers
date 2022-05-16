/* @globals self */

export function location() {
  return self.location;
}

export function navigator() {
  return self.navigator;
}

export function _postMessage(data) {
  return function(tr) {
    return function () {
      self.postMessage(data, tr.length > 0 ? tr : undefined);
    };
  };
}

export function close() {
  self.close();
}

export function onMessage(f) {
  return function () {
    self.onmessage = function (ev) {
      f(ev)();
    };
  };
}

export function onMessageError(f) {
  return function () {
    self.onmessageerror = function (ev) {
      f(ev)();
    };
  };
}

export function onError(f) {
  return function () {
    self.onerror = function (ev) {
      f(ev)();
    };
  };
}