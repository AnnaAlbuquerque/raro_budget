import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:raro_budget/src/modules/login/create_account/create_account_controller.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';
import 'package:raro_budget/src/shared/validators/validators.dart';
import 'package:raro_budget/src/shared/widgets/custom_main_text_title/custom_main_text_title_widget.dart';
import 'package:raro_budget/src/shared/widgets/custom_text_form_field/custom_text_form_field_widget.dart';
import 'package:raro_budget/src/shared/widgets/custom_visible/custom_visible_widget.dart';

class PasswordWidget extends StatefulWidget {
  final Validators validators;
  PasswordWidget({
    Key? key,
    required this.validators,
  }) : super(key: key);

  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  final controller = Modular.get<CreateAccountController>();

  bool passwordVisible = true;
  bool confirmPasswordVisible = true;

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
              subtitle: "Agora crie sua senha contendo:",
              newUser: false,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "•  pelo menos oito caracteres\n•  letras maiúsculas, letras \n   minúsculas, números e símbolos",
                    style: TextStyles.black5416w400Roboto,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    name: 'Crie uma senha',
                    obscureText: passwordVisible,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) =>
                        widget.validators.passwordValidator(value),
                    controller: controller.passwordController,
                    icon: VisibleWidget(
                      visible: passwordVisible,
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    name: 'Confirme sua senha',
                    obscureText: confirmPasswordVisible,
                    textInputType: TextInputType.visiblePassword,
                    controller: controller.confirmPasswordController,
                    validator: (value) => widget.validators
                        .confirmPasswordValidator(
                            value, controller.passwordController.text),
                    icon: VisibleWidget(
                      visible: confirmPasswordVisible,
                      onPressed: () {
                        setState(() {
                          confirmPasswordVisible = !confirmPasswordVisible;
                        });
                      },
                    ),
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
