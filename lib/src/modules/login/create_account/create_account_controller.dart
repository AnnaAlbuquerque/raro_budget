import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_budget/src/shared/models/user_model.dart';

part 'create_account_controller.g.dart';

class CreateAccountController = CreateAccountBase
    with _$CreateAccountController;

abstract class CreateAccountBase with Store {
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
      name: "", email: "", phone: "", cpf: "", terms: false, password: "");

  @action
  void saveNewUserData() {
    var savedUser = newUser.copyWith(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        cpf: cpfController.text,
        terms: termsAccepted,
        password: passwordController.text);

    print(savedUser);
  }
}
