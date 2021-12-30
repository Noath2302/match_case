typedef EvalFn<V> = V Function();

U match<T, U>(T value, Map<T, EvalFn<U>> fns, U defaultValue) {
  for (var entry in fns.entries) {
    var key = entry.key;
    if (key is Function && key()) {
      return entry.value();
    } else if (entry.key == value) {
      return entry.value();
    }
  }
  return defaultValue;
}
