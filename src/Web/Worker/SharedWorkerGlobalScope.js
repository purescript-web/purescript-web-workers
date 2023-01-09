/* @globals self */

export function name () {
  return self.name;
}

export function close() {
  self.close();
}

export function onConnect(f) {
  return function () {
    self.onconnect = function (ev) {
      f(ev)();
    };
  };
}