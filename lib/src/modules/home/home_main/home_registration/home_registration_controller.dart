import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_registration_controller.g.dart';

class HomeRegistrationController = _HomeRegistrationControllerBase
    with _$HomeRegistrationController;

abstract class _HomeRegistrationControllerBase with Store {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
}
