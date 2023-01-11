export function closeImpl(port) {
  port.close();
}

export function startImpl(port) {
  port.start();
}

export function onMessageImpl(port, f) {
  port.onmessage = f;
}

export function onMessageErrorImpl(port, f) {
  port.onmessageerror = f;
}

export function postMessageImpl(port, data, transfer) {
  port.postMessage(data, transfer.length > 0 ? transfer : undefined);
}
