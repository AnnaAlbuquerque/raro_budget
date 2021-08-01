import 'package:flutter/material.dart';
import 'modules/login/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raro Budget',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
