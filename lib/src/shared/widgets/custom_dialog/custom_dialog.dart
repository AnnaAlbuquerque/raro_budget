import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function? function;
  const CustomDialog(
      {Key? key, required this.title, required this.subtitle, this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(color: AppColors.purple),
      ),
      content: Text(
        subtitle,
        style: TextStyle(color: AppColors.black87),
      ),
      actions: [
        function == null
            ? TextButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: AppColors.cyan),
                ),
                onPressed: () {
                  Modular.to.pop();
                },
              )
            : TextButton(
                child: Text(
                  "Tentar Novamente",
                  style: TextStyle(color: AppColors.cyan),
                ),
                onPressed: () {
                  function!();
                },
              )
      ],
    );
  }
}
