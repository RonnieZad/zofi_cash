//  ZOFI CASH APP
//
//  Created by Ronnie Zad Muhanguzi .
//  2022, Zofi Cash App. All rights reserved.
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zofi_cash/animation/delayed_animation.dart';
import 'package:zofi_cash/constants/constants.dart';
import 'package:zofi_cash/controllers/pager_controller.dart';
import 'package:zofi_cash/screens/screens.dart';

/// #####  Pager class
/// Here we are creating our [Pager] class
/// This is like our main canvas on which we paint and draw pages and then put it up on the wall
///  [MyApp] for this case.
class Pager extends StatefulWidget {
  const Pager({Key? key}) : super(key: key);

  @override
  State<Pager> createState() => _PagerState();
}

class _PagerState extends State<Pager> {
  /// Here we are injecting the [PagerController] dependency
  final pagerController = Get.put(PagerController());

  final List<BottomNavigationBarItem> navBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'STAKE',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.money_dollar),
      label: 'GET PAID',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.checkmark_shield_fill),
      label: 'INSURANCE',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.lightbulb_fill),
      label: 'FINANCES',
    )
  ];

  List<Widget> navPages = const [
    HomePage(),
    GetPaidPage(),
    InsurancePage(),
    FinancesPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: pagerController.pageController,
          itemCount: navBarItems.length,
          onPageChanged: (value) {
            setState(() {
              pagerController.currentIndex.value = value;
            });
          },
          itemBuilder: ((context, index) {
            return navPages[index];
          }),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          left: 0.0,
          child: DelayedAnimation(
            delay: 1000,
            child: Obx(() {
              return BottomNavigationBar(
                items: navBarItems,
                currentIndex: pagerController.currentIndex.value,
                onTap: pagerController.pageShuffler,
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: navBarSelectedTabTextStyle,
                unselectedLabelStyle: navBarUnSelectedTabTextStyle,
                unselectedItemColor: Colors.white38,
                selectedItemColor: Colors.blue,
              );
            }),
          ),
        )
      ],
    );
  }
}
