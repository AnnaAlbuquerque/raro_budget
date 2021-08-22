// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:raro_budget/src/shared/auth/auth_repository.dart';
import 'package:raro_budget/src/shared/enums/firebase_status.dart';
import 'package:raro_budget/src/shared/models/user_model.dart';

class AuthController {
  AuthController(this.authRepository);

  final AuthRepository authRepository;
  final UserModel userModel = UserModel(
    name: "",
    email: "",
    phone: "",
    cpf: "",
    terms: false,
    password: "",
    generalBalance: 0,
  );

  ConnectionStatus getConnectionStatus() {
    return authRepository.getConnectionStatus();
  }

  Future<void> initilizer() async {
    await authRepository.initializer();
  }

  bool checkUserLogged() {
    final User? userLogged = authRepository.auth.currentUser;

    if (userLogged != null) {
      print("USER LOGGED");
      return true;
    } else {
      print("NO USER LOGGED");
      return false;
    }
  }

  void getUser() {
    UserModel userResponse;
    try {
      authRepository.store
          .collection('users')
          .doc(authRepository.auth.currentUser!.uid)
          .get()
          .then(
            (value) => {
              userResponse = UserModel.fromMap(value.data()!),
              userModel.name = userResponse.name,
              userModel.email = userResponse.email,
              userModel.phone = userResponse.phone,
              userModel.cpf = userResponse.cpf,
              userModel.terms = userResponse.terms,
              userModel.generalBalance = userResponse.generalBalance,
              print(userModel.name),
            },
          );
    } catch (e) {
      print("DIDN'T SAVE USER INFORMATION");
    }
  }

  Future<void> userLogout() async {
    await authRepository.auth.signOut();
    print("USER LOGGED OUT!!");
  }
}
