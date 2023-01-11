export function newImpl(src, opts) {
  return new Worker(src, opts);
}

export function postMessageImpl(worker, data, transfer) {
  worker.postMessage(data, transfer.length > 0 ? transfer : undefined);
}

export function terminateImpl(worker) {
  worker.terminate();
}

export function onMessageImpl(worker, f) {
  worker.onmessage = f;
}

export function onMessageErrorImpl(worker, f) {
  worker.onmessageerror = f;
}

export function onErrorImpl(worker, f) {
  worker.onerror = f;
}
