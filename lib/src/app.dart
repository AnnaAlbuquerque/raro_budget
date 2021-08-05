import 'package:flutter/material.dart';
import 'package:raro_budget/src/modules/create_account/widgets/phone_cpf_widget.dart';
import 'package:raro_budget/src/modules/login/login_page.dart';
import 'package:raro_budget/src/modules/splash/splash_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raro Budget',
      debugShowCheckedModeBanner: false,
      home: PhoneCPFWidget(),
    );
  }
}
