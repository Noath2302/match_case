import 'package:match_case/src/match_ext.dart';

typedef EvalFn<V> = V Function();

U match<T, U>(T value, Map<MatchFn<T>, EvalFn<U>> fns, U defaultValue) {
  for (var entry in fns.entries) {
    var matchFn = entry.key;
    if (matchFn(value)) {
      return entry.value();
    }
  }
  return defaultValue;
}
