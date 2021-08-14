import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/home/home_controller.dart';
import 'package:raro_budget/src/modules/home/pages/home_page.dart';
import 'package:raro_budget/src/modules/home/pages/home_page_filled.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => HomeController())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => HomePage()),
        ChildRoute("/homefilled", child: (_, __) => HomePageFilled()),
      ];
}
