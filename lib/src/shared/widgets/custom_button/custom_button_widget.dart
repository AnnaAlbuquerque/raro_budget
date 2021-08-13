import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final IconData? iconLeft;
  final IconData? iconRight;
  final VoidCallback? onTap;
  final bool? useGradientBackground;

  const CustomButton({
    Key? key,
    this.text,
    this.iconLeft,
    this.iconRight,
    this.onTap,
    this.useGradientBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool iconLeftVisible = true;
    bool iconRightVisible = true;
    bool textVisible = true;
    bool leftSizedBoxVisible = false;
    bool rightSizedBoxVisible = false;

    double paddingLeft = 10;
    double paddingRight = 10;

    if (iconLeft == null) {
      iconLeftVisible = false;
    }

    if (iconRight == null) {
      iconRightVisible = false;
    }

    if (text == null) {
      textVisible = false;
    }

    if (textVisible && iconRightVisible) {
      paddingRight = 3;
      paddingLeft = 3;
      rightSizedBoxVisible = true;
    }

    if (textVisible && iconLeftVisible) {
      paddingRight = 3;
      paddingLeft = 3;
      leftSizedBoxVisible = true;
    }

    if (textVisible && iconLeftVisible && iconRightVisible) {
      paddingRight = 3;
      paddingLeft = 3;
      rightSizedBoxVisible = true;
      leftSizedBoxVisible = true;
    }

    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Ink(
          padding: EdgeInsets.only(
              top: 10, bottom: 10, left: paddingLeft, right: paddingRight),
          //height: 40,
          decoration:
              useGradientBackground != null && useGradientBackground == false
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.white,
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: AppColors.cyanToPurpleAppBar,
                    ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: iconLeftVisible,
                child: Row(
                  children: [
                    Icon(
                      iconLeft,
                      size: 20,
                      color: useGradientBackground != null &&
                              useGradientBackground == false
                          ? AppColors.black26
                          : AppColors.white,
                    ),
                    // SizedBox(width: 8),
                  ],
                ),
              ),
              Visibility(
                visible: leftSizedBoxVisible,
                child: SizedBox(
                  width: 8,
                ),
              ),
              Visibility(
                visible: textVisible,
                child: Row(
                  children: [
                    Text(
                      textVisible ? text as String : "",
                      style: useGradientBackground != null &&
                              useGradientBackground == false
                          ? TextStyles.black2614w500Roboto
                          : TextStyles.white14w500Roboto,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: rightSizedBoxVisible,
                child: SizedBox(
                  width: 8,
                ),
              ),
              Visibility(
                visible: iconRightVisible,
                child: Row(
                  children: [
                    // SizedBox(width: 8),
                    Icon(
                      iconRight,
                      size: 20,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
