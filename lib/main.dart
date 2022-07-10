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
import 'package:oktoast/oktoast.dart';
import 'package:zofi_cash/pager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const OKToast(
      animationCurve: Curves.easeIn,
      animationDuration: Duration(milliseconds: 200),
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application. You might like to think of it as the wall of our
  // house on which we pin and hang our Pager which is our canvas
  @override
  Widget build(BuildContext context) {
    //setting screen ratio so it does not change with device DPI
    return ScreenUtilInit(
      designSize: const Size(520, 890),
      builder: (c, w) => MaterialApp(
        home: const Pager(),
        title: 'Zofi Demo',
        color: const Color.fromARGB(255, 9, 47, 237),
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
              TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            },
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (context, widget) {
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 0.9),
            child: widget!,
          );
        },
      ),
    );
  }
}
