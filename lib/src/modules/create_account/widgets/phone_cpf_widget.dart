import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/validators/validators.dart';
import 'package:raro_budget/src/shared/widgets/custom_button/custom_button_widget.dart';
import 'package:raro_budget/src/shared/widgets/custom_button_logged/custom_button_logged_widget.dart';
import 'package:raro_budget/src/shared/widgets/custom_main_text_title/custom_main_text_title_widget.dart';
import 'package:raro_budget/src/shared/widgets/custom_text_form_field/custom_text_form_field_widget.dart';

class PhoneCPFWidget extends StatefulWidget {
  const PhoneCPFWidget({Key? key}) : super(key: key);

  @override
  _PhoneCPFWidgetState createState() => _PhoneCPFWidgetState();
}

class _PhoneCPFWidgetState extends State<PhoneCPFWidget> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final validators = Validators();

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
          child: Form(
            key: _formKey,
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
                    controller: _phoneController,
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(height: 16.0),
                  CustomTextFormField(
                    validator: (value) => validators.cpfValidator(value),
                    name: 'CPF',
                    controller: _cpfController,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(height: 52.0),
                ],
              ),
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
                Text("2/4"),
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
