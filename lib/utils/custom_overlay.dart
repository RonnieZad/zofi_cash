//  ZOFI CASH APP
//
//  Created by Ronnie Zad Muhanguzi .
//  2022, Zofi Cash App. All rights reserved.
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:oktoast/oktoast.dart';

class CustomOverlay {
  CustomOverlay._();

  /// #### Show Toast method
  /// Here we have a static `showToast` method of type [ToastFuture] from the `package:oktoast`
  /// It takes parameters message of type [String] which is th text to display, bgColor od type
  /// [Color] which is the background color of the Toast and textColor of type [Color] which is the
  /// color of the text.
  /// This method returns the `showToastWidget` from `package:oktoast` which displays a toast
  static ToastFuture showToast(String message, Color bgColor, Color textColor,
      {isError = false}) {
    Widget widget = Stack(clipBehavior: Clip.none, children: [
      Padding(
        padding: EdgeInsets.only(left: 40.w, right: 40.w),
        child: Material(
          shadowColor: bgColor,
          borderRadius: BorderRadius.circular(26.r),
          color: bgColor,
          elevation: 40.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(26.r),
            child: Container(
              width: double.infinity,
              height: 80.0,
              color: bgColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: -75.h,
        left: 20.w,
        child: bgColor == Colors.red
            ? Lottie.asset('assets/lotties/error.json', width: 175.w)
            : Container(),
      )
    ]);
    return showToastWidget(
      widget,
      position: ToastPosition.top,
      dismissOtherToast: true,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 200),
      duration: const Duration(seconds: 4),
    );
  }

  ///specify duration in seconds eg 2
  static showLoaderOverlay({int? duration}) {
    IgnorePointer loaderOverlay = IgnorePointer(
      child: SizedBox(
        width: 80.w,
        height: 80.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: SizedBox(
                  width: 30.w,
                  height: 30.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 4.w,
                    valueColor: const AlwaysStoppedAnimation(
                      Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    showToastWidget(
      loaderOverlay,
      dismissOtherToast: true,
      position: ToastPosition.center,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 200),
      duration: Duration(seconds: duration ?? 1),
    );
  }
}
