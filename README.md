<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

![Status](https://github.com/sabinbajracharya/match_case/actions/workflows/dart.yml/badge.svg?branch=main)

A dart package for pattern matching. Inspired by `match` in Rust and `when` in Kotlin

## Usage

```dart
var x = 11;
var result = match(
  x,
  {
    eq(1): () => "Its a one",
    eq(2): () => "Its a $x",
    gt(2) & lt(10): () => "Greater than 2",
    (digit) => digit == 11: () => "Its an eleven",
  },
  other: val("Error!!"),
);

expect(result, "Its an eleven");
```

## `match` Definition

```dart
U match<T, U>(
  T value, // Value that needs to be matched
  Map<bool Function(T), U Function()> fns, {
  required U Function() other,  // a method to return the default value
})
```

## List of helper matcher function

```dart
1. eq(T value)
2. neq(T value)
3. gt(num number)
4. lt(num number)
5. gte(num number)
6. lte(num number)
7. range(num from, num to)
```

## List of helper function for other param

```dart
1. val(T value) // Function that returns the passed value
2. nil<T>() // Function that returns null
```

## List of operators

```dart
1. &
2. |
```
