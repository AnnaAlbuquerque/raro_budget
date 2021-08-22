import 'package:mobx/mobx.dart';

import 'package:raro_budget/src/shared/auth/auth_controller.dart';

part 'home_controller.g.dart';

class HomeController = ControllerBase with _$HomeController;

abstract class ControllerBase with Store {
  ControllerBase(
    this.authController,
  );

  AuthController authController;
}
