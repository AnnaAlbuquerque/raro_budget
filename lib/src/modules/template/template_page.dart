import 'package:flutter/material.dart';

import 'package:raro_budget/src/shared/widgets/custom_main_text_title/custom_main_text_title_widget.dart';

class TemplatePage extends StatefulWidget {
  TemplatePage({Key? key}) : super(key: key);

  @override
  _TemplatePageState createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomMainTextTitle(
        titleFirstLine: "Vamos",
        titleSecondLine: "começar!",
        subtitle: "",
        newUser: true,
      ),
    );
  }
}
