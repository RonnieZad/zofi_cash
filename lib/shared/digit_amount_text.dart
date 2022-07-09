import 'package:flutter/material.dart';
import 'package:zofi_cash/utils/utils.dart';

import '../constants/constants.dart';

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