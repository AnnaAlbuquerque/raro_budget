import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final IconData? iconLeft;
  final IconData? iconRight;
  final VoidCallback? onTap;

  const CustomButton({
    Key? key,
    this.text,
    this.iconLeft,
    this.iconRight,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: AppColors.cyanToPurpleAppBar,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconLeft != null
                ? Icon(
                    iconLeft,
                    size: 20,
                    color: Colors.white,
                  )
                : Container(),
            SizedBox(width: 14),
            text != null
                ? Text(
                    text!,
                    style: TextStyles.white14w500Roboto,
                  )
                : Container(),
            SizedBox(width: 14),
            iconRight != null
                ? Icon(
                    iconRight,
                    size: 20,
                    color: Colors.white,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
