import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.name,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.icon,
    this.textInputType,
    this.textInputAction,
  }) : super(key: key);

  final String name;
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final bool obscureText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: name,
        labelStyle: TextStyles.black5416w400Roboto,
        suffixIcon: icon,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.purple),
        ),
      ),
      validator: validator,
    );
  }
}
