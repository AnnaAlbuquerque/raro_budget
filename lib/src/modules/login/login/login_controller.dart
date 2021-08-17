import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/auth/auth_controller.dart';

class LoginController {
  LoginController(this.authController);

  final AuthController authController;

  TextEditingController emailController = TextEditingController();

  Future<bool> verifyEmail(String email) async {
    final bool hasEmail = await authController.hasEmail(email);
    return hasEmail;
  }

  String? validateEmail(String? email) {
    print(email);

    if (email == null || email.isEmpty) {
      print("Email inválido");
      return "Email inválido";
    }
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      print("Email válido");
      return null;
    }
    return "Email inválido";
  }

  //Remover depois de teste
  Future<void> test() async {
    await authController.createTest();
  }
}
