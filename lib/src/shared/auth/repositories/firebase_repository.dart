import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:raro_budget/src/shared/enums/firebase_status.dart';

class FirebaseRepository {
  late final FirebaseAuth auth;
  late ConnectionStatus firebaseConnectionStatus;
  late final FirebaseFirestore store;

  Future<void> initializer() async {
    try {
      await Firebase.initializeApp();
      firebaseConnectionStatus = ConnectionStatus.success;
      print("CONEXÃO COM FIREBASE - SUCCESS");
      auth = FirebaseAuth.instance;
      store = FirebaseFirestore.instance;
    } catch (e) {
      firebaseConnectionStatus = ConnectionStatus.error;
      print("CONEXÃO COM FIREBASE - ERROR");
    }
  }

  ConnectionStatus getConnectionStatus() {
    return firebaseConnectionStatus;
  }

  Future<bool> hasEmail(String email) async {
    final CollectionReference userCollection = store.collection("users");
    try {
      final query = await userCollection.where("email", isEqualTo: email).get();
      if (query.size == 1) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> getEmailPasswordLogin(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      if (auth.currentUser != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
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
