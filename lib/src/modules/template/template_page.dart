import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';

class TemplatePage extends StatefulWidget {
  TemplatePage({Key? key}) : super(key: key);

  @override
  _TemplatePageState createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          "Template",
          style: TextStyle(
            color: AppColors.lightBlue,
          ),
        ),
      ),
    );
  }
}
