import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/home/widgets/custom_transaction_item/custom_transaction_item_controller.dart';
import 'package:raro_budget/src/modules/home/home_in_out/home_in_page.dart';
import 'package:raro_budget/src/modules/home/home_in_out/home_out_page.dart';
import 'package:raro_budget/src/modules/home/home_filled/home_page_filled.dart';
import 'package:raro_budget/src/modules/home/home_filled/home_page_filled_controller.dart';
import 'package:raro_budget/src/modules/home/home_main/home_controller.dart';
import 'package:raro_budget/src/modules/home/home_main/home_page.dart';
import 'package:raro_budget/src/modules/home/home_main/home_registration_drawer/home_registration_controller.dart';
import 'package:raro_budget/src/modules/home/home_main/home_registration_drawer/home_registration_page.dart';
import 'package:raro_budget/src/shared/auth/auth_controller.dart';

import 'package:raro_budget/src/shared/auth/auth_repository.dart';
import 'package:raro_budget/src/modules/home/home_repository.dart';
import 'package:raro_budget/src/shared/validators/validators.dart';

import 'package:raro_budget/src/shared/widgets/calendar/calendar_controller.dart';
import 'home_in_out/home_in_page_controller.dart';
import 'home_in_out/home_out_page_controller.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
            (i) => HomePageFilledController(i.get<HomeRepository>())),
        Bind.singleton((i) => HomeOutPageController(
            i.get<HomeRepository>(), i.get<CalendarController>())),
        Bind.singleton((i) => HomeInPageController(
            i.get<HomeRepository>(), i.get<CalendarController>())),
        Bind.singleton((i) => CalendarController()),
        Bind.singleton((i) => HomeController(i.get<HomeRepository>())),
        Bind.lazySingleton((i) => HomeRegistrationController(
            authRepository: i<AuthRepository>(),
            authController: i<AuthController>())),
        Bind.lazySingleton((i) => Validators()),
        Bind.singleton((i) =>
            HomeRepository(i.get<AuthController>(), i.get<AuthRepository>())),
        $CustomTransactionItemController,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => HomePage()),
        ChildRoute("/homefilled", child: (_, __) => HomePageFilled()),
        ChildRoute("/homeinpage", child: (_, __) => HomeInPage()),
        ChildRoute("/homeoutpage", child: (_, __) => HomeOutPage()),
        ChildRoute("/homeregistration",
            child: (_, __) => HomeRegistrationPage()),
      ];
}
