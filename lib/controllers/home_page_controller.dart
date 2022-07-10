//  ZOFI CASH APP
//
//  Created by Ronnie Zad Muhanguzi .
//  2022, Zofi Cash App. All rights reserved.
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../constants/constants.dart';

/// #####  Home Page Controller
/// Here we are creating our [HomePageController] class
class HomePageController extends GetxController {

  /// #####  Amount Controller
/// Here we are initializing the [amountController] and marking it as an observable variable using
/// [.obs] from the `package:get`
  final amountController = TextEditingController().obs;

/// #####  insertText method
/// This method is used to input text from a user via the keypad.
/// Here we first check  if the `amountController` current selection is mot empty  we then set the
/// new cursor position to the current controller position and move it by the length of the
/// [inserted text] . We then replace the substring with the [insertedText] and set it to text value
/// of the controller.
/// Also the maximum text length is set to 9.
  void insertText(String textToInsert) {
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

/// #####  showSuccessDialog
/// Here were are returning the `showDialog` method which displays a success dialog overlay to a user
/// for a successful transaction. We are using the Lottie from the `package:lottie` to display
/// an animated lottie file to the user
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
