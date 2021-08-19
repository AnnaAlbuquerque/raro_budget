// import 'package:firebase_auth/firebase_auth.dart';
import 'package:raro_budget/src/shared/auth/auth_repository.dart';
import 'package:raro_budget/src/shared/enums/firebase_status.dart';

class AuthController {
  AuthController(this._firebaseRepository);

  final AuthRepository _firebaseRepository;

  ConnectionStatus getConnectionStatus() {
    return _firebaseRepository.getConnectionStatus();
  }

  Future<void> initilizer() async {
    await _firebaseRepository.initializer();
  }

  // removi do controller as funções que pertencem ao login e que pareciam reduntantes
}
