import 'package:match_case/src/match_ext.dart';

U match<T, U>(
  T value,
  Map<MatchFn<T>, EvalFn<U>> fns, {
  required EvalFn<U> other,
}) {
  for (var entry in fns.entries) {
    var matchFn = entry.key;
    if (matchFn(value)) {
      return entry.value();
    }
  }
  return other();
}
