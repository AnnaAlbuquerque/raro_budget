import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_budget/src/shared/auth/auth_controller.dart';
import 'package:raro_budget/src/shared/auth/auth_repository.dart';
import 'package:raro_budget/src/shared/models/user_model.dart';
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

  @observable
  UserModel currentUserData = UserModel(
      name: '', email: '', phone: '', cpf: '', terms: true, password: '');

  var recoveredUser;

  @action
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

        recoveredUser = currentUserData.copyWith(
          name: userData['name'],
          email: userData['email'],
          phone: userData['phone'],
          cpf: userData['cpf'],
        );
      },
    );
  }

  @observable
  bool hasChanges = false;

  @action
  void checkNameChange(String value) {
    if (value != recoveredUser.name) {
      hasChanges = true;
    } else {
      hasChanges = false;
    }
  }

  @action
  void checkEmailChange(String value) {
    if (value != recoveredUser.email) {
      hasChanges = true;
    } else {
      hasChanges = false;
    }
  }

  @action
  void checkPhoneChange(String value) {
    if (value != recoveredUser.phone) {
      hasChanges = true;
    } else {
      hasChanges = false;
    }
  }

  @action
  void checkCpfChange(String value) {
    if (value != recoveredUser.cpf) {
      hasChanges = true;
    } else {
      hasChanges = false;
    }
  }
}
