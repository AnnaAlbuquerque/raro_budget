import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_budget/src/shared/auth/auth_controller.dart';
import 'package:raro_budget/src/shared/enums/firebase_status.dart';

part 'splash_controller.g.dart';

class SplashController = SplashBase with _$SplashController;

abstract class SplashBase with Store {
  SplashBase(this.authController);

  final AuthController authController;

  @observable
  ConnectionStatus status = ConnectionStatus.loading;

  @action
  Future<void> initializerFirebase() async {
    await authController.initilizer();
    status = authController.getConnectionStatus();
  }

  void navigation(User? user) {
    if ((status == ConnectionStatus.success) && user == null) {
      Future.delayed(Duration(seconds: 2))
          .then((_) => Modular.to.navigate("/login"));
    } else if ((status == ConnectionStatus.success) && user != null) {
      Future.delayed(Duration(seconds: 2))
          .then((_) => Modular.to.navigate("/home"));
    }
  }

  bool hasUserLogged() {
    return authController.checkUserLogged();
  }

  Future<void> logout() async {
    await authController.userLogout();
  }
}
