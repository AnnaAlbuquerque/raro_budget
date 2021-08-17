import 'package:raro_budget/src/shared/models/user_model.dart';

class HomeController {
  UserModel user = UserModel(
      name: "José",
      email: "jose@teste.com",
      phone: "111222333",
      cpf: "123.456.789.00",
      terms: true,
      password: "xxx");
  bool error = false;
  String balance = "3.000";
}
