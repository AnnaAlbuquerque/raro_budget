// import 'package:firebase_auth/firebase_auth.dart';
import 'package:raro_budget/src/shared/auth/repositories/firebase_repository.dart';
import 'package:raro_budget/src/shared/enums/firebase_status.dart';

class AuthController {
  AuthController(this._firebaseRepository);

  final FirebaseRepository _firebaseRepository;

  ConnectionStatus getConnectionStatus() {
    return _firebaseRepository.getConnectionStatus();
  }

  Future<void> initilizer() async {
    await _firebaseRepository.initializer();
  }

  Future<bool> hasEmail(String email) async {
    bool hasEmail = await _firebaseRepository.hasEmail(email);
    return hasEmail;
  }

  Future<bool> getEmailPasswordLogin(String email, String password) async {
    bool isLogged =
        await _firebaseRepository.getEmailPasswordLogin(email, password);
    return isLogged;
  }
}
