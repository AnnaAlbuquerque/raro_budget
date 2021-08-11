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

class _CreateAccountPageState
    extends ModularState<CreateAccountPage, CreateAccountController> {
  final validators = Validators();

  @override
  Widget build(BuildContext context) {
    // showDialog(
    //   context: context,
    //   builder: (context) => Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       Card(
    //         color: Colors.green,
    //         shadowColor: Color(0xFFCCCCCC),
    //         child: Padding(
    //           padding: const EdgeInsets.all(16.0),
    //           child: Text(
    //             "Para testar a validação! Neste caso, passou!",
    //             style: TextStyle(fontSize: 24, color: Colors.white),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    return Scaffold(
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
                  controller: controller,
                  validators: validators,
                ),
                TermsWidget(
                  controller: controller,
                  validators: validators,
                ),
                PasswordWidget(
                  controller: controller,
                  validators: validators,
                )
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
                onTap: () {
                  controller.decrementPageNumber();
                  controller.pageViewController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
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
                  if (controller.pageNumber == 1 &&
                      controller.formKeyNameEmail.currentState!.validate()) {
                    controller.pageViewController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                    controller.incrementPageNumber();
                  }

                  if (controller.pageNumber == 2 &&
                      controller.formKeyPhoneCPF.currentState!.validate()) {
                    controller.pageViewController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                    controller.incrementPageNumber();
                  }

                  if (controller.pageNumber ==
                          3 /*&&
                      controller.formKeyTerms.currentState!.validate()*/
                      ) {
                    controller.pageViewController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                    controller.incrementPageNumber();
                  }

                  if (controller.pageNumber == 4 &&
                      controller.formKeyPassword.currentState!.validate()) {
                    controller.pageViewController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                    controller.incrementPageNumber();
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
    );
  }
}
