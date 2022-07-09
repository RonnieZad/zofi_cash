import 'package:flutter/material.dart';

import '../constants/constants.dart';

class FinancesPage extends StatelessWidget {
  const FinancesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(10, 28, 75, 1),
      body: Center(child: Text('FINANCES', style: dialogButtonTextStyle)),
    );
  }
}
