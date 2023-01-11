/* @globals self */

export function name() {
  return self.name;
}

export function postMessageImpl(data, tr) {
  self.postMessage(data, tr.length > 0 ? tr : undefined);
}
  
export function close() {
  self.close();
}
  
export function onMessageImpl(f) {
  self.onmessage = f;
}
  
export function onMessageErrorImpl(f) {
  self.onmessageerror = f;
}
