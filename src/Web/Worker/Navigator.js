export function language(navigator) {
  return function () {
    return navigator.language;
  };
}

export function languages(navigator) {
  return function () {
    return navigator.languages;
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

export function userAgent(navigator) {
  return function () {
    return navigator.userAgent;
  };
}