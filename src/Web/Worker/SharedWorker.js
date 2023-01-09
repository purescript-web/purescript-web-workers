export function _new (src) {
  return function (opts) {
    return function () {
      return new Worker(src, opts);
    };
  };
}

export function port (worker) {
  return function () {
    return worker.port;
  }
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