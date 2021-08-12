import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

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
}
