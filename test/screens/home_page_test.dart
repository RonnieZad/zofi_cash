import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:zofi_cash/controllers/home_page_controller.dart';

void main() {
  final homePageController = Get.put(HomePageController());
  test(
    'initial value should be empty',
    () {
      expect(homePageController.amountController.value.text, '');
    },
  );

  group('test insertText function', () {
    test('check whether insert text is called and text is inserted 1', () {
      homePageController.insertText('1');
      expect(homePageController.amountController.value.text, '1');
    });

    test('check whether insert text is called and text is inserted 2', () {
      homePageController.insertText('32');
      expect(homePageController.amountController.value.text, '132');
    });

    test('check whether "." is inserted', () {
      homePageController.insertText('.29');
      expect(homePageController.amountController.value.text, '132.29');
    });
  });
}
