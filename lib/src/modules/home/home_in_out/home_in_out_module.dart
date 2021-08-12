import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/home/home_in_out/home_out_page.dart';

class HomeInOutModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute("/", child: (_, __) => HomeOutPage())];
}
