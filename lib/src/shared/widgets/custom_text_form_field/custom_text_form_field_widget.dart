import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    this.hasMask = false,
    this.inputFormatter,
    this.hint,
  }) : super(key: key);

  final String name;
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final bool obscureText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Widget? icon;
  final TextInputFormatter? inputFormatter;
  final bool hasMask;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> formatter;

    if (hasMask) {
      formatter = [inputFormatter!];
    } else {
      formatter = [];
    }

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hint,
        labelText: name,
        labelStyle: TextStyles.black5416w400Roboto,
        suffixIcon: icon,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.purple),
        ),
      ),
      validator: validator,
      inputFormatters: formatter,
    );
  }
}
