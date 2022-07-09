import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../constants/constants.dart';

class HomePageController extends GetxController {
  final amountController = TextEditingController().obs;

  insertText(String textToInsert) {
    if (amountController.value.selection.start >= 0) {
      int newPosition =
          amountController.value.selection.start + textToInsert.length;
      amountController.value.text = amountController.value.text.replaceRange(
        amountController.value.selection.start,
        amountController.value.selection.end,
        textToInsert,
      );
      amountController.value.selection = TextSelection(
        baseOffset: newPosition,
        extentOffset: newPosition,
      );
    } else if (amountController.value.text.length < 9) {
      amountController.value.text += textToInsert;
    }
  }

  Future showSuccessDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            elevation: 24.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(34.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset('assets/lotties/success-animation.json',
                      width: 350.w),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    successDialogTitle,
                    style: dialogTitleTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Your transaction of UGX ${amountController.value.text}/= was completed successfully. Thank you for using our app!',
                    style: dialogBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      HapticFeedback.lightImpact();
                    },
                    child: Container(
                      width: 260.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Center(
                        child: Text('Close', style: dialogButtonTextStyle),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
