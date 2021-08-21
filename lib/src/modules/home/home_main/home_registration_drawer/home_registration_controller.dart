import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_budget/src/shared/auth/auth_controller.dart';
import 'package:raro_budget/src/shared/auth/auth_repository.dart';
part 'home_registration_controller.g.dart';

class HomeRegistrationController = _HomeRegistrationControllerBase
    with _$HomeRegistrationController;

abstract class _HomeRegistrationControllerBase with Store {
  final AuthRepository authRepository;
  final AuthController authController;
  _HomeRegistrationControllerBase({
    required this.authRepository,
    required this.authController,
  });

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cpfController = TextEditingController();

  Future<void> loadUserData() async {
    final user = authRepository.auth.currentUser;
    final collection = authRepository.store.collection('users');

    await collection.doc(user!.uid).get().then(
      (value) {
        final userData = value.data();

        nameController.text = userData!['name'];
        emailController.text = userData['email'];
        phoneController.text = userData['phone'];
        cpfController.text = userData['cpf'];
      },
    );
  }

  //TODO: mover para home controller
  Future<void> logout() async {
    await authController.userLogout();
  }
}
