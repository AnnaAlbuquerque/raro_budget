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
    bool iconLeftVisible = true;
    bool iconRightVisible = true;
    bool textVisible = true;

    if (iconLeft == null) {
      iconLeftVisible = false;
    }

    if (iconRight == null) {
      iconRightVisible = false;
    }

    if (text == null) {
      textVisible = false;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.symmetric(horizontal: 4),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: AppColors.cyanToPurpleAppBar,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: iconLeftVisible,
              child: Row(
                children: [
                  Icon(
                    iconLeft,
                    size: 20,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
            Visibility(
              visible: textVisible,
              child: Row(
                children: [
                  Text(
                    text!,
                    style: TextStyles.white14w500Roboto,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: iconRightVisible,
              child: Row(
                children: [
                  SizedBox(width: 8),
                  Icon(
                    iconRight,
                    size: 20,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
