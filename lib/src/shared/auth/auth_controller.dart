// import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_budget/src/shared/auth/repositories/firebase_repository.dart';
import 'package:raro_budget/src/shared/enums/firebase_status.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  _AuthControllerBase(this._firebaseRepository);

  final FirebaseRepository _firebaseRepository;

  ConnectionStatus getConnectionStatus() {
    return _firebaseRepository.getConnectionStatus();
  }

  Future<void> initilizer() async {
    await _firebaseRepository.initializer();
  }

  //Remover depois de testar
  Future<void> createTest() async {
    await _firebaseRepository.auth.createUserWithEmailAndPassword(
        email: "teste@teste3.com", password: "123456");
  }
}
