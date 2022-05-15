/* @globals self */

export function location() {
  return self.location;
}

export function navigator() {
  return self.navigator;
}

export function postMessage(data) {
  return function (transfer) {
    return function () {
      self.postMessage(data, transfer.length > 0 ? transfer : undefined);
    };
  };
}

export function close() {
  self.close();
}