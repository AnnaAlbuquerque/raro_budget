import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/app.dart';
import 'package:raro_budget/src/app_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ModularApp(
      module: AppModule(),
      child: App(),
    ),
  );
}
