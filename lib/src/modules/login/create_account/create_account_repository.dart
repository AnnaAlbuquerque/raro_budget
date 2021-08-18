import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:raro_budget/src/shared/models/user_model.dart';

abstract class CreateAccountRepository {
  Future<void> addUser(UserModel user);
  bool checkUserLogin();
}

class CreateAccountRepositoryImpl implements CreateAccountRepository {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<void> addUser(UserModel user) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password,
          )
          .then(
            (value) => {
              users.doc(value.user!.uid).set({
                "name": user.name,
                "email": value.user!.email,
                "phone": user.phone,
                "cpf": user.cpf,
                "terms": user.terms,
                "createdAt": FieldValue.serverTimestamp()
              })
            },
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  bool checkUserLogin() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      print("USER LOGGED-IN");
      return true;
    } else {
      print("USER NOT LOGGED");
      return false;
    }
  }
}
