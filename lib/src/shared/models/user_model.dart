import 'dart:convert';

class UserModel {
  String name;
  String email;
  String phone;
  String cpf;
  bool terms;
  String password;
  double generalBalance;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.cpf,
    required this.terms,
    required this.password,
    required this.generalBalance,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? cpf,
    bool? terms,
    String? password,
    double? generalBalance,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cpf: cpf ?? this.cpf,
      terms: terms ?? this.terms,
      password: password ?? this.password,
      generalBalance: generalBalance ?? this.generalBalance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'cpf': cpf,
      'terms': terms,
      'password': password,
      'generalBalance': generalBalance,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      cpf: map['cpf'],
      terms: map['terms'],
      password: "",
      generalBalance:
          map['generalBalance'] != null ? map['generalBalance'] / 100 : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phone: $phone, cpf: $cpf, terms: $terms, password: $password, generalBalance: $generalBalance)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.cpf == cpf &&
        other.terms == terms &&
        other.password == password &&
        other.generalBalance == generalBalance;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        cpf.hashCode ^
        terms.hashCode ^
        password.hashCode ^
        generalBalance.hashCode;
  }
}
