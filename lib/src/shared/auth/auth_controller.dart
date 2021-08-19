// import 'package:firebase_auth/firebase_auth.dart';
import 'package:raro_budget/src/shared/auth/auth_repository.dart';
import 'package:raro_budget/src/shared/enums/firebase_status.dart';

class AuthController {
  AuthController(this.authRepository);

  final AuthRepository authRepository;

  ConnectionStatus getConnectionStatus() {
    return authRepository.getConnectionStatus();
  }

  Future<void> initilizer() async {
    await authRepository.initializer();
  }

  Future<bool> hasEmail(String email) async {
    bool hasEmail = await authRepository.hasEmail(email);
    return hasEmail;
  }

  Future<bool> getEmailPasswordLogin(String email, String password) async {
    bool isLogged = await authRepository.getEmailPasswordLogin(email, password);
    return isLogged;
  }
}
