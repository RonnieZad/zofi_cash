//  ZOFI CASH APP
//
//  Created by Ronnie Zad Muhanguzi .
//  2022, Zofi Cash App. All rights reserved.
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:zofi_cash/controllers/home_page_controller.dart';

void main() {
  group('test insertText function,', () {
    test('initial value should be empty', () {
      //Arrange
      final homePageController = Get.put(HomePageController());

      //Act

      //Assert
      expect(homePageController.amountController.value.text, '');
    });

    test('check whether insert text is called and text is inserted 1', () {
      //Arrange
      final homePageController = Get.put(HomePageController());

      //Act
      homePageController.insertText('1');

      //Assert
      expect(homePageController.amountController.value.text, '1');
    });

    test('check whether insert text is called and text is inserted 2', () {
      //Arrange
      final homePageController = Get.put(HomePageController());

      //Act
      homePageController.insertText('32');

      //Assert
      expect(homePageController.amountController.value.text, '132');
    });

    test('check whether "." is inserted', () {
      //Arrange
      final homePageController = Get.put(HomePageController());

      //Act
      homePageController.insertText('.29');

      //Assert
      expect(homePageController.amountController.value.text, '132.29');
    });
  });
}
