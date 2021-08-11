import 'package:cpf_cnpj_validator/cpf_validator.dart';

class Validators {
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
    } else {
      return null;
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

  // se for utilizar, não ficou claro no figma se precisa!
  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Ops! Preencha!";
    } else {
      return null;
    }
  }

  // não testei, se não teria que arrumar toda a parte de estado do fluxo de cadastro,
  // achei melhor esperar
  String? passwordValidator(String? value) {
    RegExp checkCharacteres = RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

    RegExp hasUpperLowerCaseLetters =
        RegExp(r"^(?=.*[a-z])(?=.*[A-Z])[a-zA-Z]{8,}$");

    RegExp hasNumbers = RegExp(r"^(?=.*\d)[\d]{8,}$");

    RegExp hasSymbols = RegExp(r"^(?=.*?[#?!@$%^&*-]){8,}$");

    if (value == null || value.isEmpty) {
      return "Ops! Coloque uma senha!";
    }

    if (value.length < 8) {
      return "Precisa ter pelo menos 8 caracteres!";
    }

    if (!checkCharacteres.hasMatch(value)) {
      if (!hasUpperLowerCaseLetters.hasMatch(value)) {
        return "Precisa ter letras maiúsculas e minúsculas";
      } else if (!hasNumbers.hasMatch(value)) {
        return "Precisa ter pelo menos um número";
      } else if (!hasSymbols.hasMatch(value)) {
        return "Precisa ter pelo menos um símbolo";
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
