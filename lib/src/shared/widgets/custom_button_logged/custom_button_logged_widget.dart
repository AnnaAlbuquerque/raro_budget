import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';

class CustomButtonLoggedFlow extends StatelessWidget {
  final String? text;
  final bool? useIconAdd;
  final VoidCallback? onTap;
  final bool? useGradientBackground;

  const CustomButtonLoggedFlow({
    Key? key,
    this.text,
    this.useIconAdd,
    this.onTap,
    this.useGradientBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool useIconAddVisible = false;
    bool textVisible = true;

    bool sizedBoxVisible = false;

    if (useIconAdd == true) {
      useIconAddVisible = true;
    }

    if (text == null) {
      textVisible = false;
    }

    if (textVisible && useIconAddVisible) {
      sizedBoxVisible = true;
    }

    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Ink(
          padding: EdgeInsets.only(top: 12, bottom: 12, left: 15, right: 15),
          height: 50,
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
                visible: useIconAddVisible,
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
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
                visible: sizedBoxVisible,
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
            ],
          ),
        ),
      ),
    );
  }
}
