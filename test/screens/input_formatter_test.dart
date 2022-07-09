import 'package:flutter_test/flutter_test.dart';
import 'package:zofi_cash/utils/utils.dart';

main() {
  group('Test Text Format,', () {
    test('when there is no user input', () {
      var digit1 = Helper.getTextDigit('');
      expect(digit1, "0");
    });
    test('when user enters random value > 1000', () {
      var digit1 = Helper.getTextDigit('34555');
      expect(digit1, "34,555");
    });

    test('when user enters random value < 1000', () {
      var digit2 = Helper.getTextDigit('231');
      expect(digit2, "231");
    });

    test('when user enters decimal value', () {
      var digit3 = Helper.getTextDigit('1645.367');
      expect(digit3, "1,645.367");
    });
  });
}
