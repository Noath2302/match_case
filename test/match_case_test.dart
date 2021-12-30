import 'package:match_case/match_case.dart';
import 'package:match_case/src/match_ext.dart';
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
      "Error!!",
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
      "Error!!",
    );

    expect(result, "Its a 2");

    result = match(
      y,
      cases,
      "Error!!",
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
      "Error!!",
    );
    expect(result, "Its an eleven");
  });
}
