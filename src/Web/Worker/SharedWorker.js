export function newImpl(src, opts) {
  return new SharedWorker(src, opts);
}

export function portImpl(worker) {
  return worker.port;
}

export function onErrorImpl(worker, f) {
  worker.onerror = f;
}
