import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'create_account_controller.g.dart';

class CreateAccountController = CreateAccountBase
    with _$CreateAccountController;

abstract class CreateAccountBase with Store {
  @observable
  int pageNumber = 1;

  @action
  void incrementPageNumber() {
    if (pageNumber < 4) {
      pageNumber++;
    }
  }

  @action
  void decrementPageNumber() {
    if (pageNumber > 1) {
      pageNumber--;
    }
  }

  final pageViewController = PageController(
    initialPage: 0,
  );

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cpfController = TextEditingController();

  bool termsAccepted = false;

  final formKeyNameEmail = GlobalKey<FormState>();
  final formKeyPassword = GlobalKey<FormState>();
  final formKeyPhoneCPF = GlobalKey<FormState>();
  final formKeyTerms = GlobalKey<FormState>();
}
