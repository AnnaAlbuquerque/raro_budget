import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:raro_budget/src/shared/models/user_model.dart';

abstract class CreateAccountRepository {
  Future<void> addUser(UserModel user);
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
    } catch (e) {
      print(e);
    }
  }
}
