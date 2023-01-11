/* @globals self */

export function name() {
  return self.name;
}

export function close() {
  self.close();
}

export function onConnectImpl(f) {
  self.onconnect = f;
}
