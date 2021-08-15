// import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_budget/src/shared/auth/repositories/auth_repository_interface.dart';
import 'package:raro_budget/src/shared/enums/firebase_status.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  _AuthControllerBase(this._authRepository);

  final IAuthRepository _authRepository;

  ConnectionStatus getConnectionStatus() {
    return _authRepository.getConnectionStatus();
  }

  Future<void> initilizer() async {
    await _authRepository.initializer();
  }
}
