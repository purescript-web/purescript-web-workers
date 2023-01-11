export function data_(ev) {
  return ev.data; 
}

export function origin(ev) {
  return ev.origin; 
}

export function lastEventId(ev) {
  return ev.lastEventId;
}

export function ports(ev) {
  return ev.ports;
}

export function sourceImpl(just, nothing, ev) {
  return ev.source == null ? nothing : just(ev.source);
}
