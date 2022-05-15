export function newImpl (src) {
  return function (opts) {
    return function () {
      return new Worker(src, opts);
    };
  };
}

export function postMessage(data) {
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
      worker.onmessage = f;
    };
  };
}

export function onError(f) {
  return function (worker) {
    return function () {
      worker.onerror = f;
    };
  };
}
