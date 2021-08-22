import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:raro_budget/src/modules/login/login/login_respository.dart';
import 'package:raro_budget/src/shared/auth/auth_repository.dart';

class LoginController {
  final AuthRepository authRepository;
  final LoginRepository loginRepository;
  LoginController(
    this.authRepository,
    this.loginRepository,
  );

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

  Future<void> loginWithGoogle() async {
    return await loginRepository.loginWithGoogle();
  }
}
