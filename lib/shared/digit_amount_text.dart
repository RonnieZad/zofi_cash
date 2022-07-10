//  ZOFI CASH APP
//
//  Created by Ronnie Zad Muhanguzi .
//  2022, Zofi Cash App. All rights reserved.
//

//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import 'package:flutter/material.dart';
import 'package:zofi_cash/utils/utils.dart';
import '../constants/constants.dart';

/// #####  Text Formatter
/// The Text Formatter returns a [Text] widget  and uses the [Helper] util class
/// to get and parse, format the text from the user using the `getTextDigit` method
class TextFormatter extends StatelessWidget {
  const TextFormatter({Key? key, required this.textToFormat}) : super(key: key);
  final String textToFormat;

  @override
  Widget build(Object context) {
    return Text(
      Helper.getTextDigit(textToFormat)!,
      textAlign: TextAlign.center,
      style: amountTextStyle,
    );
  }
}