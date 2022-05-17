export function _new (src) {
  return function (opts) {
    return function () {
      return new Worker(src, opts);
    };
  };
}

export function postMessageImpl(data) {
  return function (transfer) {
    return function (worker) {
      return function () {
        worker.postMessage(data, transfer.length > 0 ? transfer : undefined);
      };
    };
  };
}

export function terminate (worker) {
  return function () {
    worker.terminate();
  };
}

export function onMessage(f) {
  return function (worker) {
    return function () {
      worker.onmessage = function (ev) {
        f(ev)();
      };
    };
  };
}

export function onMessageError(f) {
  return function (worker) {
    return function () {
      worker.onmessageerror = function (ev) {
        f(ev)();
      };
    };
  };
}

export function onError(f) {
  return function (worker) {
    return function () {
      worker.onerror = function (ev) {
        f(ev)();
      };
    };
  };
}
