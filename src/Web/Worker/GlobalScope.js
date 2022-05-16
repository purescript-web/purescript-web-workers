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