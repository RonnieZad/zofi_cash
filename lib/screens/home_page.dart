import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zofi_cash/constants/constants.dart';
import 'package:zofi_cash/controllers/home_page_controller.dart';
import 'package:zofi_cash/shared/shared.dart';
import 'package:zofi_cash/utils/utils.dart';

import '../animation/animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(10, 28, 75, 1),
        body: Stack(children: <Widget>[
          Positioned(
            top: 50.h,
            right: 10.w,
            left: 10.w,
            child: DelayedFade(
              delay: 300,
              child: Row(
                children: <Widget>[
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.lock,
                        size: 26,
                        color: Colors.white24,
                      )),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.person,
                          size: 26, color: Colors.white24))
                ],
              ),
            ),
          ),
          Positioned(
            top: 140.h,
            right: 10.w,
            left: 10.w,
            child: Column(
              children: <Widget>[
                DelayedFade(
                  delay: 450,
                  child: Text(
                    homePageTitle,
                    textAlign: TextAlign.center,
                    style: homePageTextStyle,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Obx(() {
                  return DelayedFade(
                    delay: 550,
                    child: TextFormatter(
                        textToFormat:
                            homePageController.amountController.value.text),
                  );
                }),
                SizedBox(
                  height: 10.h,
                ),
                DelayedFade(
                  delay: 650,
                  child: Text(
                    homePageCurrencyText,
                    textAlign: TextAlign.center,
                    style: currencyTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: -10.h,
              child: Animator(
                  delay: 400,
                  builder: (context, w, value) {
                    return Transform.translate(
                      offset: Offset(0, 100 * (1 - value)),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2 + 80,
                        decoration: const BoxDecoration(
                            border: Border.symmetric(
                                horizontal: BorderSide(color: Colors.white10)),
                            color: Color.fromRGBO(12, 35, 68, 1)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GridView.builder(
                                padding: EdgeInsets.only(
                                    left: 10.w, right: 10.w, top: 25.h),
                                itemCount: 9,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: 65.w,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        crossAxisCount: 3),
                                itemBuilder: (context, index) {
                                  return DelayedFade(
                                    delay: 750 + (index * 5),
                                    child: KeyPadButton(
                                        index: index,
                                        tapAction: () {
                                          HapticFeedback.lightImpact();
                                          homePageController
                                              .insertText('${index + 1}');
                                          setState(() {});
                                        }),
                                  );
                                }),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 20.h,
                                left: 55.w,
                                right: 55.w,
                              ),
                              child: DelayedFade(
                                delay: 850,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    KeyPadButton(
                                      index: 9,
                                      tapAction: () {
                                        HapticFeedback.lightImpact();
                                        if (!homePageController
                                            .amountController.value.text
                                            .contains('.')) {
                                          homePageController.insertText('.');
                                        }

                                        setState(() {});
                                      },
                                    ),
                                    KeyPadButton(
                                      index: 10,
                                      tapAction: () {
                                        homePageController.insertText('0');
                                        setState(() {});
                                      },
                                    ),
                                    KeyPadButton(
                                      index: 11,
                                      tapAction: () {
                                        HapticFeedback.lightImpact();
                                        if (homePageController.amountController
                                            .value.text.isNotEmpty) {
                                          homePageController
                                                  .amountController.value.text =
                                              homePageController
                                                  .amountController
                                                  .value
                                                  .value
                                                  .text
                                                  .substring(
                                                      0,
                                                      homePageController
                                                              .amountController
                                                              .value
                                                              .value
                                                              .text
                                                              .length -
                                                          1);
                                          setState(() {});
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                            DelayedAnimation(
                              delay: 950,
                              child: Container(
                                height: 60.h,
                                margin: EdgeInsets.symmetric(horizontal: 40.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: buttonColor,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                        onPressed: () async {
                                          HapticFeedback.lightImpact();
                                          if (homePageController
                                              .amountController
                                              .value
                                              .text
                                              .isEmpty) {
                                            CustomOverlay.showToast(
                                                'Charge is empty, Type in amount',
                                                Colors.red,
                                                Colors.white);
                                          } else {
                                            CustomOverlay.showLoaderOverlay();
                                            await Future.delayed(
                                                const Duration(seconds: 2));
                                            homePageController
                                                .showSuccessDialog(context);
                                          }
                                        },
                                        child: Text(homePageStakeFunds,
                                            style: homeActionButtonTextStyle)),
                                    VerticalDivider(
                                      color: Colors.white54,
                                      indent: 10.w,
                                      endIndent: 10.w,
                                    ),
                                    TextButton(
                                        onPressed: () async {
                                          HapticFeedback.lightImpact();
                                          if (homePageController
                                              .amountController
                                              .value
                                              .text
                                              .isEmpty) {
                                            CustomOverlay.showToast(
                                                'Charge is empty, Type in amount',
                                                Colors.red,
                                                Colors.white);
                                          } else {
                                            CustomOverlay.showLoaderOverlay();
                                            await Future.delayed(
                                                const Duration(seconds: 2));
                                            homePageController
                                                .showSuccessDialog(context);
                                          }
                                        },
                                        child: Text(homePageGetPaid,
                                            style: homeActionButtonTextStyle))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ]));
  }
}
