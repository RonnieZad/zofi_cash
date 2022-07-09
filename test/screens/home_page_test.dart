import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:zofi_cash/controllers/home_page_controller.dart';

void main() {
  final homePageController = Get.put(HomePageController());
  test(
    'initial value should be 0',
    () {
      expect(homePageController.amountController.value.text, '');
    },
  );

  group('insertText', () {
    test('check whether insert text is called', () {
      homePageController.insertText('1');
      expect(homePageController.amountController.value.text, '1');
    });
  });
}
