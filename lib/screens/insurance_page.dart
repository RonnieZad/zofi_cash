//  ZOFI CASH APP
//
//  Created by Ronnie Zad Muhanguzi .
//  2022, Zofi Cash App. All rights reserved.
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import 'package:flutter/material.dart';
import '../constants/constants.dart';

/// #####  Insurance Page
/// This is the insurance page
class InsurancePage extends StatelessWidget {
  const InsurancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 28, 75, 1),
      body: Center(child: Text('INSURANCE', style: dialogButtonTextStyle)),
    );
  }
}
