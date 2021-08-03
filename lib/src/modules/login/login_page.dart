import 'package:flutter/material.dart';
import '../../shared/widgets/custom_button/custom_button_widget.dart';
import '../../shared/widgets/custom_main_text_title/custom_main_text_title_widget.dart';
import '../../shared/widgets/custom_social_login_button/custom_social_login_button_widget.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_text_styles.dart';
import '../../shared/widgets/custom_text_form_field/custom_text_form_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
                ),
                SizedBox(height: 46.0),
                CustomTextFormField(
                  name: 'E-mail',
                  controller: _emailController,
                ),
                SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                    text: 'CONTINUAR',
                  ),
                ),
                SizedBox(height: 52.0),
                Align(
                  alignment: Alignment.center,
                  child: Text('ou', style: TextStyles.black5416w400Roboto),
                ),
                SizedBox(height: 9.0),
                CustomSocialLoginButton(
                  text: 'CONTINUAR COM O GOOGLE',
                  image: 'assets/images/logo_google.png',
                  color: AppColors.white,
                  textStyle: TextStyles.black5414w500Roboto,
                  horizontal: 31.0,
                  vertical: 8.0,
                ),
                SizedBox(height: 16.0),
                CustomSocialLoginButton(
                  text: 'CONTINUAR COM O FACEBOOK',
                  image: 'assets/images/logo_facebook.png',
                  color: AppColors.chambray,
                  borderColor: AppColors.chambray,
                  textStyle: TextStyles.white14w500Roboto,
                  horizontal: 23.0,
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
