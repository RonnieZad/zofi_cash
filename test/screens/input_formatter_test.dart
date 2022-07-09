import 'package:flutter_test/flutter_test.dart';
import 'package:zofi_cash/utils/utils.dart';

main() {
  group('Text Text Format', () {
    test('Test text formatter 1', () {
      var digit1 = Helper.getTextDigit('34555');
      expect(digit1, "34,555");
    });

    test('Test text formatter 2', () {
      var digit2 = Helper.getTextDigit('231');
      expect(digit2, "231");
    });

    test('Test text formatter 3', () {
      var digit3 = Helper.getTextDigit('1645.367');
      expect(digit3, "1,645.367");
    });
  });
}
