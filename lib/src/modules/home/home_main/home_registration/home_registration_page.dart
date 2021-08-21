import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/home/home_main/home_registration/home_registration_controller.dart';
import 'package:raro_budget/src/modules/home/home_main/home_registration/widgets/custom_button_registration/custom_button_registration.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';
import 'package:raro_budget/src/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:raro_budget/src/shared/widgets/custom_text_form_field/custom_text_form_field_widget.dart';

class HomeRegistrationPage extends StatefulWidget {
  HomeRegistrationPage({Key? key}) : super(key: key);

  @override
  _HomeRegistrationPageState createState() => _HomeRegistrationPageState();
}

class _HomeRegistrationPageState extends State<HomeRegistrationPage> {
  final controller = Modular.get<HomeRegistrationController>();
  final bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: CustomAppBar ajustes?
      appBar: CustomAppBar(
        title: 'Cadastro',
        prefSize: 189,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, top: 16.0, right: 16.0, bottom: 40.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(7.0),
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(0.25),
                  offset: Offset(0.0, 4.0),
                  blurRadius: 4.0,
                  spreadRadius: 0),
              BoxShadow(
                color: AppColors.black.withOpacity(0.12),
                offset: Offset(0.0, 1.0),
                blurRadius: 10.0,
              ),
              BoxShadow(
                color: AppColors.black.withOpacity(0.14),
                offset: Offset(0.0, 4.0),
                blurRadius: 5.0,
              ),
              BoxShadow(
                color: AppColors.black.withOpacity(0.2),
                offset: Offset(0.0, 2.0),
                blurRadius: 4.0,
                spreadRadius: -1.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, top: 40, right: 40.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomTextFormField(
                    name: 'Nome',
                    textInputType: TextInputType.number,
                    controller: controller.nameController,
                  ),
                  CustomTextFormField(
                    name: 'CPF',
                    textInputType: TextInputType.number,
                    controller: controller.nameController,
                  ),
                  CustomTextFormField(
                    name: 'E-mail',
                    controller: controller.emailController,
                  ),
                  CustomTextFormField(
                    //TODO: mantendo padrão do create account, telefone ao invés de celular
                    name: 'Telefone',
                    controller: controller.emailController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButtonRegistration(
        isValid: _isValid,
        text: 'SALVAR ALTERAÇÕES',
        onTap: () {},
      ),
    );
  }
}
