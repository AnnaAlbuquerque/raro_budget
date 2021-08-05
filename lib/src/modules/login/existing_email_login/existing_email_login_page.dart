import 'package:flutter/material.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/widgets/custom_button/custom_button_widget.dart';
import '../../../shared/widgets/custom_main_text_title/custom_main_text_title_widget.dart';
import '../../../shared/widgets/custom_text_form_field/custom_text_form_field_widget.dart';

class ExistingEmailLoginPage extends StatefulWidget {
  const ExistingEmailLoginPage({Key? key}) : super(key: key);

  @override
  _ExistingEmailLoginPageState createState() => _ExistingEmailLoginPageState();
}

class _ExistingEmailLoginPageState extends State<ExistingEmailLoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                  controller: _emailController,
                ),
                const SizedBox(height: 50.0),
                CustomTextFormField(
                  name: 'Senha',
                  obscureText: _isObscure,
                  controller: _passwordController,
                  icon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () => setState(() => _isObscure = !_isObscure),
                  ),
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('RECUPERAR SENHA',
                        style: TextStyles.purple14w500Roboto),
                    CustomButton(
                      text: 'CONTINUAR',
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
