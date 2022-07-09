import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:zofi_cash/controllers/pager_controller.dart';

void main() {
  final pageController = Get.put(PagerController());
  group('test page shuffler,', () {
    test('check current index init value', () {
      expect(pageController.currentIndex.value, 0);
    });

    test('check current page index', () {
      var pageChanger = pageController.pageShuffler(0);
      expect(pageChanger.value, 0);
    });

    test('check current page index set to 1', () {
      var pageChanger = pageController.pageShuffler(1);
      expect(pageChanger.value, 1);
    });
  });
}
