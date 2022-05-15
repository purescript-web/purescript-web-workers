export function hash(location) {
  return function () {
    return location.hash;
  };
}
  
export function host(location) {
  return function () {
    return location.host;
  };
}
  
export function hostname(location) {
  return function () {
    return location.hostname;
  };
}
  
export function href(location) {
  return function () {
    return location.href;
  };
}

export function origin(location) {
  return function () {
    return location.origin;
  };
}
  
export function pathname(location) {
  return function () {
    return location.pathname;
  };
}
  
export function port(location) {
  return function () {
    return location.port;
  };
}
  
export function protocol(location) {
  return function () {
    return location.protocol;
  };
}
  
export function search(location) {
  return function () {
    return location.search;
  };
}