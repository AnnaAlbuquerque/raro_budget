import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/auth/auth_controller.dart';

class LoginController {
  LoginController(this.authController);

  final AuthController authController;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<bool> verifyEmail(String email) async {
    final bool hasEmail = await authController.hasEmail(email);
    return hasEmail;
  }

  // String? validateEmail() {
  //   print(emailController.text);

  //   if (emailController.text.isEmpty) {
  //     print("Email inválido");
  //     return "Email inválido";
  //   }
  //   if (RegExp(
  //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //       .hasMatch(emailController.text)) {
  //     print("Email válido");
  //     return null;
  //   }
  //   return "Email inválido";
  // }

  // String? validatePassword() {
  //   if (passwordController.text.isEmpty) {
  //     return "Senha inválida";
  //   }
  //   return null;
  // }

  Future<bool> login(String email, String password) async {
    bool isLogged = await authController.getEmailPasswordLogin(email, password);
    return isLogged;
  }
}
