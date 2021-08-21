import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:raro_budget/src/modules/login/create_account/create_account_controller.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/validators/validators.dart';
import 'package:raro_budget/src/shared/widgets/custom_main_text_title/custom_main_text_title_widget.dart';
import 'package:raro_budget/src/shared/widgets/custom_text_form_field/custom_text_form_field_widget.dart';

class PhoneCPFWidget extends StatefulWidget {
  final Validators validators;
  PhoneCPFWidget({
    Key? key,
    required this.validators,
  }) : super(key: key);

  @override
  _PhoneCPFWidgetState createState() => _PhoneCPFWidgetState();
}

class _PhoneCPFWidgetState extends State<PhoneCPFWidget> {
  final controller = Modular.get<CreateAccountController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.only(
              left: 48.0, top: 74.0, right: 48.0, bottom: 32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  width: 100.0,
                  height: 54.0,
                  image: AssetImage('assets/images/logo_budget_blue.png'),
                ),
                SizedBox(height: 16.0),
                CustomMainTextTitle(
                  titleFirstLine: 'Bem-vindo!',
                  subtitle: 'Mais alguns dados.',
                  newUser: false,
                ),
                SizedBox(height: 46.0),
                CustomTextFormField(
                  name: 'Telefone',
                  controller: controller.phoneController,
                  textInputType: TextInputType.phone,
                  hasMask: true,
                  inputFormatter:
                      MaskTextInputFormatter(mask: '(##) #####-####'),
                  validator: (value) => widget.validators.phoneValidator(value),
                  hint: "(00) 00000-0000",
                ),
                SizedBox(height: 16.0),
                CustomTextFormField(
                  name: 'CPF',
                  controller: controller.cpfController,
                  textInputType: TextInputType.number,
                  hasMask: true,
                  inputFormatter:
                      MaskTextInputFormatter(mask: '###.###.###-##'),
                  //validator: (value) => widget.validators.cpfValidator(value),
                  hint: "000.000.000-00",
                ),
                SizedBox(height: 16.0),
                SizedBox(height: 52.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
