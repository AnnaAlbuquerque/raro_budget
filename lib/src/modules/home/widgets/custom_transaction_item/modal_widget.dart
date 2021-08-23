import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';
import 'package:raro_budget/src/shared/widgets/custom_button/custom_button_widget.dart';

class ModalWidget extends StatelessWidget {
  final String titulo;
  final String descricao;
  final String buttonLeft;
  final String buttonRight;
  final Function()? onTapbuttonLeft;
  final Function()? onTapbuttonRight;

  const ModalWidget(this.titulo, this.descricao, this.buttonLeft,
      this.buttonRight, this.onTapbuttonLeft, this.onTapbuttonRight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.selagotowhite,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(24),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('$titulo', style: TextStyles.purple20w500Roboto),
            SizedBox(
              height: 24,
            ),
            Text('$descricao', style: TextStyles.purple20w500Roboto),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: onTapbuttonLeft,
                    child:
                        Text(buttonLeft, style: TextStyles.purple20w500Roboto)),
                TextButton(
                    onPressed: onTapbuttonRight,
                    child: Text(buttonRight,
                        style: TextStyles.purple20w500Roboto)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
