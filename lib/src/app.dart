import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raro Budget',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
    ).modular();
  }
}
