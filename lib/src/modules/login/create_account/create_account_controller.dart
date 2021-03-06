import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_budget/src/modules/login/create_account/create_account_repository.dart';
import 'package:raro_budget/src/shared/auth/auth_controller.dart';
import 'package:raro_budget/src/shared/models/user_model.dart';

part 'create_account_controller.g.dart';

class CreateAccountController = CreateAccountBase
    with _$CreateAccountController;

abstract class CreateAccountBase with Store {
  final CreateAccountRepository repository;
  final AuthController authController;

  CreateAccountBase({
    required this.authController,
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

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cpfController = TextEditingController();

  bool termsAccepted = false;

  @observable
  UserModel newUser = UserModel(
    name: "",
    email: "",
    phone: "",
    cpf: "",
    terms: false,
    password: "",
    generalBalance: 0,
  );

  @action
  void saveNewUserData() {
    var savedUser = newUser.copyWith(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      cpf: cpfController.text,
      terms: termsAccepted,
      password: confirmPasswordController.text,
      generalBalance: 0,
    );

    repository.addUser(savedUser);

    print(savedUser);
    print("USER CREATED!");
  }

  @action
  bool checkUserLogin() {
    return authController.checkUserLogged();
  }
}
