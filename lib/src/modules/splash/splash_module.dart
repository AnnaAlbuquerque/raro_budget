import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/splash/splash_controller.dart';
import 'package:raro_budget/src/modules/splash/splash_page.dart';
import 'package:raro_budget/src/shared/auth/auth_controller.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => SplashController(i.get<AuthController>())),
      ];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute("/", child: (_, __) => SplashPage())];
}
