import 'package:cpf_cnpj_validator/cpf_validator.dart';

class Validators {
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
}
