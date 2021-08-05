import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/widgets/custom_main_text_title/custom_main_text_title_widget.dart';
import 'package:raro_budget/src/shared/widgets/custom_text_form_field/custom_text_form_field_widget.dart';

class NameEmailWidget extends StatefulWidget {
  NameEmailWidget({Key? key}) : super(key: key);

  @override
  _NameEmailWidgetState createState() => _NameEmailWidgetState();
}

class _NameEmailWidgetState extends State<NameEmailWidget> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

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
              subtitle: "Por favor insira seus dados no campo abaixo",
              newUser: false,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFormField(
                      name: 'Nome',
                      controller: _nameController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      name: 'E-mail',
                      controller: _emailController,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}