import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class CustomSocialLoginButton extends StatelessWidget {
  const CustomSocialLoginButton({
    Key? key,
    required this.text,
    required this.image,
    required this.color,
    required this.textStyle,
    this.borderColor,
    required this.horizontal,
    required this.vertical,
  }) : super(key: key);

  final String text;
  final String image;
  final Color color;
  final Color? borderColor;
  final TextStyle textStyle;
  final double horizontal;
  final double vertical;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      onTap: () {},
      child: Ink(
        height: 36.0,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: borderColor ?? AppColors.grey)),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: Row(
            children: [
              Image(image: AssetImage(image)),
              SizedBox(width: 8.0),
              Text(text, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}
