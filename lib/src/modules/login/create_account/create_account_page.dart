import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:raro_budget/src/modules/login/create_account/widgets/name_email_widget.dart';
import 'package:raro_budget/src/modules/login/create_account/widgets/password_widget.dart';
import 'package:raro_budget/src/modules/login/create_account/widgets/phone_cpf_widget.dart';
import 'package:raro_budget/src/modules/login/create_account/create_account_controller.dart';
import 'package:raro_budget/src/modules/login/create_account/widgets/terms_widget.dart';

import 'package:raro_budget/src/shared/widgets/custom_button/custom_button_widget.dart';

class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final CreateAccountController _controller = CreateAccountController();
  final _pageViewController = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 1,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageViewController,
              children: [
                NameEmailWidget(),
                PhoneCPFWidget(),
                TermsWidget(),
                PasswordWidget()
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
                  _controller.decrementPageNumber();
                  _pageViewController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                },
              ),
              Observer(builder: (_) {
                return Text("${_controller.pageNumber}/4");
              }),
              CustomButton(
                iconRight: Icons.forward,
                text: 'CONTINUAR',
                useGradientBackground: true,
                onTap: () {
                  _pageViewController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                  _controller.incrementPageNumber();

                  // if (_formKey.currentState!.validate()) {
                  //   showDialog(
                  //     context: context,
                  //     builder: (context) => Column(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Card(
                  //           color: Colors.green,
                  //           shadowColor: Color(0xFFCCCCCC),
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(16.0),
                  //             child: Text(
                  //               "Para testar a validação! Neste caso, passou!",
                  //               style: TextStyle(
                  //                   fontSize: 24, color: Colors.white),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   );
                  // }
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
