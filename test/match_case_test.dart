import 'package:match_case/match_case.dart';
import 'package:test/test.dart';

void main() {
  test('Test Match case', () async {
    var x = 2;
    var result = match(
      x,
      {
        1: () => "Its a one",
        () => x == 2 || x == 3: () => "Its a $x",
      },
      "Error!!",
    );
    expect(result, "Its a 2");
  });
}
