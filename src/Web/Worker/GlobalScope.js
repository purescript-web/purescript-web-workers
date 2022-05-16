/* @globals self */

export function location() {
  return self.location;
}

export function navigator() {
  return self.navigator;
}

export function postMessage(data) {
  return function () {
    self.postMessage(data);
  };
}

export function close() {
  self.close();
}

export function onMessage(f) {
  return function () {
    self.onmessage = f;
  };
}

export function onMessageError(f) {
  return function () {
    self.onmessageerror = f;
  };
}

export function onError(f) {
  return function () {
    self.onerror = f;
  };
}