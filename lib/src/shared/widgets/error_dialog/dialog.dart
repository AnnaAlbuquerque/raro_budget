import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function? function;
  const ErrorDialog(
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
                  print("sem função");
                },
              )
            : TextButton(
                child: Text(
                  "Tentar Novamente",
                  style: TextStyle(color: AppColors.cyan),
                ),
                onPressed: () {
                  function;
                },
              )
      ],
    );
  }
}
