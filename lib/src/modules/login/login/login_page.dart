import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/login/login/login_controller.dart';
import 'package:raro_budget/src/shared/validators/validators.dart';
import '../../../shared/widgets/custom_button/custom_button_widget.dart';
import '../../../shared/widgets/custom_main_text_title/custom_main_text_title_widget.dart';
import '../../../shared/widgets/custom_social_login_button/custom_social_login_button_widget.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/widgets/custom_text_form_field/custom_text_form_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final validators = Modular.get<Validators>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  titleFirstLine: 'Vamos',
                  titleSecondLine: 'Começar!',
                  newUser: true,
                  function: () {
                    Modular.to.navigate("/login/create_account");
                  },
                ),
                SizedBox(height: 46.0),
                CustomTextFormField(
                  name: 'E-mail',
                  controller: controller.emailController,
                  validator: (value) => validators.emailValidator(value),
                ),
                SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                    text: 'CONTINUAR',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        controller.continueButtonFunction(context);
                      }
                    },
                  ),
                ),
                SizedBox(height: 52.0),
                Align(
                  alignment: Alignment.center,
                  child: Text('ou', style: TextStyles.black5416w400Roboto),
                ),
                SizedBox(height: 9.0),
                CustomSocialLoginButton(
                  onTap: controller.loginWithGoogle,
                  text: 'CONTINUAR COM O GOOGLE',
                  image: 'assets/images/logo_google.png',
                  color: AppColors.white,
                  textStyle: TextStyles.black5414w500Roboto,
                  horizontal: 31.0,
                  vertical: 8.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
