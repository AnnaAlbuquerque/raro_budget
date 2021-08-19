import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/login/create_account/create_account_controller.dart';
import 'package:raro_budget/src/modules/login/create_account/create_account_page.dart';
import 'package:raro_budget/src/modules/login/create_account/create_account_repository.dart';
import 'package:raro_budget/src/shared/auth/auth_repository.dart';
import 'package:raro_budget/src/shared/validators/validators.dart';
import 'onboarding/onboarding_page.dart';

class CreateAccountModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => CreateAccountRepositoryImpl()),
        Bind.singleton((i) => CreateAccountController(
            repository: i<CreateAccountRepositoryImpl>(),
            authRepository: i<AuthRepository>())),
        Bind.lazySingleton((i) => Validators())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => CreateAccountPage()),
        ChildRoute("/onboarding", child: (_, __) => OnboardingPage()),
      ];
}
