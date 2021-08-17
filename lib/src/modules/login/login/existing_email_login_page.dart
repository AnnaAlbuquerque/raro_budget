import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/login/login/login_controller.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/widgets/custom_button/custom_button_widget.dart';
import '../../../shared/widgets/custom_main_text_title/custom_main_text_title_widget.dart';
import '../../../shared/widgets/custom_text_form_field/custom_text_form_field_widget.dart';

class ExistingEmailLoginPage extends StatefulWidget {
  const ExistingEmailLoginPage({Key? key}) : super(key: key);

  @override
  _ExistingEmailLoginPageState createState() => _ExistingEmailLoginPageState();
}

class _ExistingEmailLoginPageState
    extends ModularState<ExistingEmailLoginPage, LoginController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 48.0, top: 74.0, right: 48.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/images/logo_budget_blue.png'),
                ),
                const SizedBox(height: 16.0),
                CustomMainTextTitle(
                  titleFirstLine: 'Insira sua',
                  titleSecondLine: 'senha',
                  newUser: false,
                ),
                const SizedBox(height: 82.0),
                CustomTextFormField(
                  name: 'Email',
                  controller: controller.emailController,
                  validator: (_) {
                    return controller.validateEmail();
                  },
                ),
                const SizedBox(height: 50.0),
                CustomTextFormField(
                  name: 'Senha',
                  obscureText: _isObscure,
                  controller: controller.passwordController,
                  validator: (_) {
                    return controller.validatePassword();
                  },
                  icon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    //TODO modificar isObscure com o mobx
                    onPressed: () => setState(() => _isObscure = !_isObscure),
                  ),
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Ink(
                        child: Text('RECUPERAR SENHA',
                            style: TextStyles.purple14w500Roboto),
                      ),
                    ),
                    CustomButton(
                      text: 'CONTINUAR',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          controller
                              .login(controller.emailController.text,
                                  controller.passwordController.text)
                              .then((value) => {
                                    if (value)
                                      {Modular.to.navigate("/home")}
                                    else
                                      {
                                        //TODO modal com mensagem de credenciais inválidas
                                        print("NAO LOGOU")
                                      }
                                  });
                        } else {
                          //TODO colocar modal com mensagem de email inválido
                          print("NAO LOGOU");
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
