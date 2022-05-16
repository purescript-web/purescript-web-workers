export function close(port) {
  return function () {
    port.close();
  };
}

export function start(port) {
  return function () {
    port.start();
  };
}

export function onMessage(f) {
  return function (port) {
    return function () {
      port.onmessage = function (ev) {
        f(ev)();
      };
    };
  };
}

export function onMessageError(f) {
  return function (port) {
    return function () {
      port.onmessageerror = function (ev) {
        f(ev)();
      };
    };
  };
}

export function _postMessage(data) {
  return function (transfer) {
    return function (worker) {
      return function () {
        worker.postMessage(data, transfer.length > 0 ? transfer : undefined);
      };
    };
  };
}
