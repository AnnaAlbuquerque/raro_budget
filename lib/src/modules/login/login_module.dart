import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/login/create_account/create_account_page.dart';
import 'package:raro_budget/src/modules/login/existing_email_login/existing_email_login_page.dart';
import 'package:raro_budget/src/modules/login/login/login_controller.dart';
import 'package:raro_budget/src/modules/login/login/login_page.dart';
import 'package:raro_budget/src/shared/auth/auth_controller.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => LoginController(i.get<AuthController>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => LoginPage()),
        ChildRoute("/create_account", child: (_, __) => CreateAccountPage()),
        ChildRoute("/existing_email",
            child: (_, __) => ExistingEmailLoginPage()),
      ];
}
