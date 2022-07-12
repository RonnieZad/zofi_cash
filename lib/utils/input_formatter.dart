//  ZOFI CASH APP
//
//  Created by Ronnie Zad Muhanguzi .
//  2022, Zofi Cash App. All rights reserved.
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import 'package:intl/intl.dart';

class Helper {
  /// #### Get Text Digit method
  /// This is the `getTextDigit` method of type [String?]. It takes a parameter [textToFormat] of
  /// type [String?] and returns the parsed and formatted string.
  /// Here we check whether the [textToFormat] string is empty or equal to null, then we proceed
  /// to check whether the input string contains a decimal point "." and if yes we can then split
  /// the string into two substrings along the decimal point.
  /// We then format the the fist part which is the whole number using the
  ///  `NumberFormat.decimalPattern().format()` from the `package:intl` and this returns a
  /// formatted string with a comma separator "," for digits above 1000. We then concatenate the two
  /// strings together plus a decimal point "." and return the string. if the input [textToFormat]
  /// string does not contain  a string, we simply format the string as seen above and return the
  /// formatted string and otherwise we return zero "0" is the [textToFormat] is null...This is when
  /// a user has not input any digit yet.
  String? getTextDigit(String? textToFormat) {
    if (textToFormat != null && textToFormat.isNotEmpty) {
      textToFormat = textToFormat.contains('.')
          ? '${NumberFormat.decimalPattern().format(int.parse(textToFormat.split('.')[0]))}.${textToFormat.split('.')[1]}'
          : textToFormat != ''
              ? NumberFormat.currency(name: '', decimalDigits: 0)
                  .format(int.parse(textToFormat))
              : '0';
    } else {
      return '0';
    }

    return textToFormat;
  }
}
