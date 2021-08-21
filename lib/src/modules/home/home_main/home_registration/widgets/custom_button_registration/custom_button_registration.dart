import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';

class CustomButtonRegistration extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool? isValid;

  const CustomButtonRegistration({
    Key? key,
    required this.text,
    this.onTap,
    this.isValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Ink(
          padding: EdgeInsets.only(top: 12, bottom: 12, left: 15, right: 15),
          height: 50,
          decoration: isValid != null && isValid == false
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.grey88,
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: AppColors.cyanToPurpleAppBar,
                ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    text,
                    style: isValid != null && isValid == false
                        ? TextStyles.black3815w500Roboto
                        : TextStyles.white15w500Roboto,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
