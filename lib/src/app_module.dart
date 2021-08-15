import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/home/home_module.dart';
import 'package:raro_budget/src/modules/login/login_module.dart';
import 'package:raro_budget/src/modules/splash/splash_module.dart';
import 'package:raro_budget/src/shared/auth/auth_controller.dart';
import 'package:raro_budget/src/shared/auth/repositories/firebase_repository.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => FirebaseRepository()),
        Bind.singleton((i) => AuthController(i.get<FirebaseRepository>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: SplashModule()),
        ModuleRoute("/login", module: LoginModule()),
        ModuleRoute("/home", module: HomeModule()),
      ];
}
