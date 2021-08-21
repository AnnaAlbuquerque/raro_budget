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

  bool checkUserLogged() {
    final user = authRepository.auth.currentUser;

    if (user != null) {
      print("USER LOGGED");
      return true;
    } else {
      print("NO USER LOGGED");
      return false;
    }
  }

  Future<void> userLogout() async {
    await authRepository.auth.signOut();
    print("USER LOGGED OUT!!");
  }
}
