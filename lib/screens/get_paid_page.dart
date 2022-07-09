import 'package:flutter/material.dart';

import '../constants/constants.dart';

class GetPaidPage extends StatelessWidget {
  const GetPaidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 28, 75, 1),
      body: Center(child: Text('GET PAID', style: dialogButtonTextStyle)),
    );
  }
}
