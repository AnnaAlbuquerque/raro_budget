import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes =>
      [ChildRoute("/", child: (_, __) => SplashPage())];
}
