import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/home/home_controller.dart';
import 'package:raro_budget/src/modules/home/home_in_out/home_in_page.dart';
import 'package:raro_budget/src/modules/home/home_in_out/home_out_page.dart';
import 'package:raro_budget/src/modules/home/pages/home_page.dart';
import 'package:raro_budget/src/modules/home/pages/home_page_filled.dart';
import 'package:raro_budget/src/modules/home/pages/home_page_filled_controller.dart';
import 'package:raro_budget/src/shared/auth/repositories/firebase_repository.dart';
import 'package:raro_budget/src/shared/models/firebase_model.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => HomePageFilledController(i.get<FirebaseModel>())),
        //  Bind.singleton((i) => HomeController(i.get<FirebaseModel>())),
        Bind.singleton((i) => FirebaseModel(i.get<FirebaseRepository>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => HomePage()),
        ChildRoute("/homefilled", child: (_, __) => HomePageFilled()),
        ChildRoute("/homeinpage", child: (_, __) => HomeInPage()),
        ChildRoute("/homeoutpage", child: (_, __) => HomeOutPage()),
      ];
}
