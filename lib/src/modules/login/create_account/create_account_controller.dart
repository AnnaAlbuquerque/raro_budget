import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_budget/src/modules/login/create_account/create_account_repository.dart';
import 'package:raro_budget/src/shared/models/user_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

part 'create_account_controller.g.dart';

class CreateAccountController = CreateAccountBase
    with _$CreateAccountController;

abstract class CreateAccountBase with Store {
  final CreateAccountRepository repository;
  CreateAccountBase({
    required this.repository,
  });

  @observable
  PageController pageViewController = PageController(
    initialPage: 0,
  );

  @observable
  int pageNumber = 1;

  @action
  void showCurrentPageNumber() {
    pageNumber = pageViewController.page!.toInt() + 1;
  }

  // var phoneFormatter = new MaskTextInputFormatter(
  //   mask: '(##) #####-####',
  //   // filter: {"#": RegExp(r'[0-9]')},
  // );

  // var cpfFormatter = new MaskTextInputFormatter(
  //   mask: '###.###.###-##',
  //   // filter: {"#": RegExp(r'[0-9]')},
  // );

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cpfController = TextEditingController();

  bool termsAccepted = false;

  @observable
  UserModel newUser = UserModel(
      name: "", email: "", phone: "", cpf: "", terms: false, password: "");

  @action
  void saveNewUserData() {
    var savedUser = newUser.copyWith(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        cpf: cpfController.text,
        terms: termsAccepted,
        password: confirmPasswordController.text);

    repository.addUser(savedUser);

    print("USER CREATED!");
    print(savedUser);
  }

  @action
  bool checkUserLogin() {
    return repository.checkUserLogin();
  }
}
