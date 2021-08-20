import 'package:flutter/material.dart';
import 'package:raro_budget/src/shared/auth/auth_repository.dart';

class LoginController {
  final AuthRepository authRepository;

  LoginController({required this.authRepository});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<bool> verifyEmail(String email) async {
    bool hasEmail = await authRepository.hasEmail(email);
    return hasEmail;
  }

  Future<bool> login(String email, String password) async {
    bool isLogged = await authRepository.getEmailPasswordLogin(email, password);
    return isLogged;
  }
}
