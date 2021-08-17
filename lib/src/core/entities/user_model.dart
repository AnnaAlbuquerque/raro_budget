class UserModel {
  UserModel({
    required this.name,
    this.cfp,
    this.email,
    this.phone,
  });

  String name;
  String? cfp;
  String? email;
  String? phone;
}
