import 'package:cpf_cnpj_validator/cpf_validator.dart';

class Validators {
  RegExp checkEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  RegExp checkPassword = RegExp(
      r"^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$");

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Ops! Preencha!";
    } else {
      return null;
    }
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Ops! Preencha!";
    } else if (checkEmail.hasMatch(value)) {
      return null;
    } else {
      return "Email inválido!";
    }
  }

  String? cpfValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "O CPF é necessário para conectar suas contas";
    } else if (CPFValidator.isValid(value) == false) {
      return "Não é um CPF valido!";
    } else {
      return null;
    }
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Ops! Preencha!";
    } else {
      return null;
    }
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Ops! Coloque uma senha!";
    } else if (!checkPassword.hasMatch(value)) {
      return "O password não atende aos requisitos!";
    } else {
      return null;
    }
  }

  String? confirmPasswordValidator(String? value1, String? value2) {
    if (value2 == null || value2.isEmpty) {
      return "Ops! É necessário confirmar a senha!";
    } else if (value1 != value2) {
      return "Campos não batem!";
    } else {
      return null;
    }
  }
}
