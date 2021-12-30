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

A dart package for pattern matching. Inspired by `match` in Rust and `when` in Kotlin

## Usage

```dart
var x = 2;
var result = match(
  x,
  {
    1: () => "Its a one",
    () => x == 2 || x == 3: () => "Its a $x",
  },
  "Error!!", // (Optional) default value in case nothing is matched
);

// Output
$ "Its a 2"
```

## `match` Definition
```dart
U match<T, U>(
  T value, // Value that needs to be matched
  Map<T, U Function()> fns, // T -> Any primitive values or a function that returns true or false
  U defaultValue, // Optional value that is returned when nothing is matched
)
```
