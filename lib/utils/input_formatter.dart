import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:zofi_cash/constants/constants.dart';

class Helper {
  static String? getTextDigit(String? textToFormat) {
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


