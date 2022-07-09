import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagerController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentIndex = 0.obs;

  pageShuffler(int selectedPage) {
    currentIndex.value = selectedPage;
    if (pageController.hasClients) {
      switch (currentIndex.value) {
        case 0:
          pageController.animateToPage(0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate);

          break;

        case 1:
          pageController.animateToPage(1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate);

          break;

        case 2:
          pageController.animateToPage(2,
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate);

          break;

        case 3:
          pageController.animateToPage(3,
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate);

          break;
        default:
          '';
      }
    }

    return currentIndex;
  }
}
