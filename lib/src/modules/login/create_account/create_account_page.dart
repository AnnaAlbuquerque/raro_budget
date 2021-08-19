import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:raro_budget/src/modules/login/create_account/widgets/name_email_widget.dart';
import 'package:raro_budget/src/modules/login/create_account/widgets/password_widget.dart';
import 'package:raro_budget/src/modules/login/create_account/widgets/phone_cpf_widget.dart';
import 'package:raro_budget/src/modules/login/create_account/create_account_controller.dart';
import 'package:raro_budget/src/modules/login/create_account/widgets/terms_widget.dart';
import 'package:raro_budget/src/shared/validators/validators.dart';

import 'package:raro_budget/src/shared/widgets/custom_button/custom_button_widget.dart';

class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final controller = Modular.get<CreateAccountController>();
  final validators = Modular.get<Validators>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 1,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller.pageViewController,
                children: [
                  NameEmailWidget(
                    validators: validators,
                  ),
                  PhoneCPFWidget(
                    validators: validators,
                  ),
                  TermsWidget(
                    validators: validators,
                  ),
                  PasswordWidget(
                    validators: validators,
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  iconLeft: Icons.arrow_back,
                  text: 'VOLTAR',
                  useGradientBackground: false,
                  onTap: () async {
                    if (controller.pageNumber == 1) {
                      Modular.to.navigate('/login');
                    } else {
                      await controller.pageViewController.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear,
                      );
                      controller.showCurrentPageNumber();
                    }
                  },
                ),
                Observer(builder: (_) {
                  return Text("${controller.pageNumber}/4");
                }),
                CustomButton(
                  iconRight: Icons.forward,
                  text: 'CONTINUAR',
                  useGradientBackground: true,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      controller.pageViewController
                          .nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear,
                          )
                          .then(
                            (_) => controller.showCurrentPageNumber(),
                          );
                    }

                    if (controller.pageNumber == 4 &&
                        _formKey.currentState!.validate()) {
                      Modular.to.pushNamed('/login/create_account/onboarding');
                      controller.saveNewUserData();
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
