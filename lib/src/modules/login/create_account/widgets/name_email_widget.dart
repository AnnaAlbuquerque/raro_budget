import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/login/create_account/create_account_controller.dart';

import 'package:raro_budget/src/shared/validators/validators.dart';

import 'package:raro_budget/src/shared/widgets/custom_main_text_title/custom_main_text_title_widget.dart';
import 'package:raro_budget/src/shared/widgets/custom_text_form_field/custom_text_form_field_widget.dart';

class NameEmailWidget extends StatefulWidget {
  final Validators validators;
  NameEmailWidget({
    Key? key,
    required this.validators,
  }) : super(key: key);

  @override
  _NameEmailWidgetState createState() => _NameEmailWidgetState();
}

class _NameEmailWidgetState extends State<NameEmailWidget> {
  final controller = Modular.get<CreateAccountController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 74.0, 48.0, 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              width: 100.0,
              height: 54.0,
              image: AssetImage('assets/images/logo_budget_blue.png'),
            ),
            CustomMainTextTitle(
              titleFirstLine: "Bem-vindo!",
              subtitle: "Por favor insira seus dados no campo abaixo",
              newUser: false,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    name: 'Nome',
                    controller: controller.nameController,
                    validator: (value) =>
                        widget.validators.nameValidator(value),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    name: 'E-mail',
                    controller: controller.emailController,
                    validator: (value) =>
                        widget.validators.emailValidator(value),
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
