import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/login/create_account/create_account_module.dart';
import 'package:raro_budget/src/modules/login/login/existing_email_login_page.dart';
import 'package:raro_budget/src/modules/login/login/login_controller.dart';
import 'package:raro_budget/src/modules/login/login/login_page.dart';
import 'package:raro_budget/src/shared/auth/auth_controller.dart';
import 'package:raro_budget/src/shared/auth/repositories/firebase_repository.dart';
import 'package:raro_budget/src/shared/models/firebase_model.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => LoginController(i.get<AuthController>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => LoginPage()),
        ChildRoute("/existing_email",
            child: (_, __) => ExistingEmailLoginPage()),
        ModuleRoute("/create_account", module: CreateAccountModule()),
      ];
}
