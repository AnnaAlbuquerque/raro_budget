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

  Future<bool> login(String email, String password) async {
    bool isLogged = await authController.getEmailPasswordLogin(email, password);
    return isLogged;
  }
}
