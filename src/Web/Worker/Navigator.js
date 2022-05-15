export function language(navigator) {
  return function () {
    return navigator.language;
  };
}

export function hardwareConcurrency(navigator) {
  return function () {
    return navigator.hardwareConcurrency;
  };
}

export function onLine(navigator) {
  return function () {
    return navigator.onLine;
  };
}