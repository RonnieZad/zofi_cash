//  ZOFI CASH APP
//
//  Created by Ronnie Zad Muhanguzi .
//  2022, Zofi Cash App. All rights reserved.
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// #####  Pager Controller
/// Here we are creating our  [PagerController] class
class PagerController extends GetxController {

/// #####  Page Controller
/// Here we are initializing the [pageController] value
  final PageController pageController = PageController();

/// #####  Current Index
/// Here we are initializing the [currentIndex] value to 0 and marking it as an observable variable
///  using [.obs] from the `package:get`
  RxInt currentIndex = 0.obs;

/// #####  pageShuffler method
/// This method is used to change pages using the bottom navigation bar.
/// Here we take the current selected page from navigation bar and then set it to new page index
/// selected by the user using the `onTap` callback.
/// We then check whether the [pageController] has been initialized and has views/pages attached
/// to it and then switch between pages using the current index and the [pageController]
  RxInt pageShuffler(int selectedPage) {
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
