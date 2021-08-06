import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/login/login_module.dart';
import 'package:raro_budget/src/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: SplashModule()),
        ModuleRoute("/login", module: LoginModule()),
      ];
}
