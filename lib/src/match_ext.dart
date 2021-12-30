typedef MatchFn<T> = bool Function(T n);

extension MatchCaseOperators<T> on MatchFn<T> {
  MatchFn<T> operator &(MatchFn<T> other) {
    return (n) => this(n) && other(n);
  }

  MatchFn<T> operator |(MatchFn<T> other) {
    return (n) => this(n) || other(n);
  }

  MatchFn<T> operator >>(bool Function() g) {
    return (n) => this(n) && g();
  }

  MatchFn<T> operator >(bool g) {
    return (n) => this(n) && g;
  }
}

MatchFn<T> eq<T>(T value) {
  return (n) => n == value;
}

MatchFn<num> gt(num number) {
  return (n) => n > number;
}

MatchFn<num> lt(num number) {
  return (n) => n < number;
}

MatchFn<num> gte(num number) {
  return (n) => n >= number;
}

MatchFn<num> lte(num number) {
  return (n) => n <= number;
}

MatchFn<num> range(num from, num to) {
  return (n) => n >= from && n <= to;
}
