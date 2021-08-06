import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/constants/app_text_styles.dart';
import 'package:raro_budget/src/shared/validators/validators.dart';
import 'package:raro_budget/src/shared/widgets/custom_button/custom_button_widget.dart';
import 'package:raro_budget/src/shared/widgets/custom_main_text_title/custom_main_text_title_widget.dart';

class TermsWidget extends StatefulWidget {
  const TermsWidget({Key? key}) : super(key: key);

  @override
  _TermsWidgetState createState() => _TermsWidgetState();
}

class _TermsWidgetState extends State<TermsWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final validators = Validators();
  bool _userTermOption = false;

  static const termMock =
      "Lorem Ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. \n\nIpsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Nque porro  est qui dolorem ipsum quia dolor sit amet, , adipisci velit. Quisquam est qui dolorem ipsum.Lorem Ipsum neque porro \n\nquisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. \n\nNque porro  est qui dolorem ipsum quia dolor sit amet, , adipisci velit. Quisquam est qui dolorem ipsum.";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 74.0, bottom: 32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 48.0,
                    right: 48.0,
                  ),
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
                        subtitle: 'Leia com atenção e aceite.',
                        newUser: false,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 30.0),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.36,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                termMock,
                                style: TextStyles.black5416w400Roboto,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Checkbox(
                            value: _userTermOption,
                            shape: CircleBorder(),
                            onChanged: (value) {
                              setState(() {
                                _userTermOption = value as bool;
                              });
                            },
                          ),
                          Text(
                            "Eu li e aceito os termos e condições \ne a Política de privacidade do budget",
                            style: TextStyles.black5416w400Roboto,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
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
                  onTap: () {},
                ),
                Text("3/4"),
                CustomButton(
                  iconRight: Icons.forward,
                  text: 'CONTINUAR',
                  useGradientBackground: true,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (context) => Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Card(
                                    color: Colors.green,
                                    shadowColor: Color(0xFFCCCCCC),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        "Para testar a validação! Neste caso, passou!",
                                        style: TextStyle(
                                            fontSize: 24, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ));
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
