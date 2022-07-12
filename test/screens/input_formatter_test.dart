//  ZOFI CASH APP
//
//  Created by Ronnie Zad Muhanguzi .
//  2022, Zofi Cash App. All rights reserved.
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import 'package:flutter_test/flutter_test.dart';
import 'package:zofi_cash/utils/utils.dart';

main() {
  group('Test Text Format,', () {
    test('when there is no user input', () {
      //Arrange
      Helper helperFunction = Helper();

      //Act
      var digit1 = helperFunction.getTextDigit('');

      //Assert
      expect(digit1, "0");
    });
    test('when user enters random value > 1000', () {
      //Arrange
      Helper helperFunction = Helper();

      //Act
      var digit2 = helperFunction.getTextDigit('34555');

      //Assert
      expect(digit2, "34,555");
    });

    test('when user enters random value < 1000', () {
      //Arrange
      Helper helperFunction = Helper();

      //Act
      var digit3 = helperFunction.getTextDigit('231');

      //Assert
      expect(digit3, "231");
    });

    test('when user enters decimal value', () {
      //Arrange
      Helper helperFunction = Helper();

      //Act
      var digit4 = helperFunction.getTextDigit('1645.367');

      //Assert
      expect(digit4, "1,645.367");
    });
  });
}
