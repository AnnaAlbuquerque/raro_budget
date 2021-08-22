import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:raro_budget/src/modules/home/home_main/home_registration_drawer/home_registration_controller.dart';
import 'package:raro_budget/src/modules/home/home_main/home_registration_drawer/widgets/custom_button_registration/custom_button_registration.dart';
import 'package:raro_budget/src/shared/constants/app_colors.dart';

import 'package:raro_budget/src/shared/validators/validators.dart';
import 'package:raro_budget/src/shared/widgets/custom_appbar/custom_appbar.dart';
import 'package:raro_budget/src/shared/widgets/custom_text_form_field/custom_text_form_field_widget.dart';

class HomeRegistrationPage extends StatefulWidget {
  HomeRegistrationPage({Key? key}) : super(key: key);

  @override
  _HomeRegistrationPageState createState() => _HomeRegistrationPageState();
}

class _HomeRegistrationPageState extends State<HomeRegistrationPage> {
  final controller = Modular.get<HomeRegistrationController>();
  final validators = Modular.get<Validators>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Cadastro',
        prefSize: 189,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
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
              padding: const EdgeInsets.only(
                  left: 40.0, top: 40, right: 40.0, bottom: 40),
              child: SingleChildScrollView(
                child: Observer(
                  builder: (context) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomTextFormField(
                        name: 'Nome',
                        textInputType: TextInputType.name,
                        controller: controller.nameController,
                        onChange: (value) => controller.checkNameChange(value),
                        validator: (value) => validators.nameValidator(value),
                      ),
                      CustomTextFormField(
                        name: 'CPF',
                        textInputType: TextInputType.number,
                        controller: controller.cpfController,
                        onChange: (value) => controller.checkCpfChange(value),
                        validator: (value) => validators.cpfValidator(value),
                      ),
                      CustomTextFormField(
                        name: 'E-mail',
                        textInputType: TextInputType.emailAddress,
                        controller: controller.emailController,
                        onChange: (value) => controller.checkEmailChange(value),
                        validator: (value) => validators.emailValidator(value),
                      ),
                      CustomTextFormField(
                        //TODO: mantendo padrão do create account, telefone ao invés de celular
                        name: 'Telefone',
                        textInputType: TextInputType.phone,
                        controller: controller.phoneController,
                        onChange: (value) => controller.checkPhoneChange(value),
                        validator: (value) => validators.phoneValidator(value),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Observer(
        builder: (context) => CustomButtonRegistration(
          hasChanges: controller.hasChanges,
          text: 'SALVAR ALTERAÇÕES',
          onTap: () async {
            await controller.saveUserData();
            await controller.loadUserData();
          },
        ),
      ),
    );
  }
}
