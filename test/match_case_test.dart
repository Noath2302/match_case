import 'package:match_case/match_case.dart';
import 'package:test/test.dart';

void main() {
  test('Test Match case', () async {
    var x = 2;
    var result = match(
      x,
      {
        eq(1): () => "Its a one",
        (_) => x == 2 || x == 3: () => "Its a $x",
      },
      other: val("Error!!"),
    );
    expect(result, "Its a 2");
  });

  test('Test Match operators', () async {
    var x = 2;
    var y = 3;

    var cases = {
      eq(1): () => "Its a one",
      eq(2): () => "Its a $x",
      gt(2): () => "Greater than 2",
    };

    var result = match(
      x,
      cases,
      other: val("Error!!"),
    );

    expect(result, "Its a 2");

    result = match(
      y,
      cases,
      other: val("Error!!"),
    );
    expect(result, "Greater than 2");
  });

  test('Test Match custom operators', () async {
    var x = 11;

    var cases = {
      eq(1): () => "Its a one",
      eq(2): () => "Its a $x",
      gt(2) & lt(10): () => "Greater than 2",
      (digit) => digit == 11: () => "Its an eleven",
    };

    var result = match(
      x,
      cases,
      other: val("Error!!"),
    );
    expect(result, "Its an eleven");
  });

  test('Test Match with enums', () async {
    var enm = MyEnum.a2;
    var result = match(
      enm,
      {
        eq(MyEnum.a1): () => "a1",
        eq(MyEnum.a2): () => "a2",
      },
      other: nil<String>(),
    );
    expect(result, "a2");
  });
}

enum MyEnum { a1, a2 }
