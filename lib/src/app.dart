import 'package:flutter/material.dart';
import 'package:raro_budget/src/modules/template/template_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raro Budget',
      debugShowCheckedModeBanner: false,
      home: TemplatePage(),
    );
  }
}
