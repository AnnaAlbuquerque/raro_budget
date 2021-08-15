import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:raro_budget/src/shared/enums/firebase_status.dart';

class FirebaseRepository {
  late final FirebaseAuth auth;
  late ConnectionStatus firebaseConnectionStatus;

  Future<void> initializer() async {
    try {
      await Firebase.initializeApp();
      firebaseConnectionStatus = ConnectionStatus.success;
      print("CONEXÃO COM FIREBASE - SUCCESS");
      auth = FirebaseAuth.instance;
    } catch (e) {
      firebaseConnectionStatus = ConnectionStatus.error;
      print("CONEXÃO COM FIREBASE - ERROR");
    }
  }

  ConnectionStatus getConnectionStatus() {
    return firebaseConnectionStatus;
  }

  // Future<bool> verifyEmail(String email){
  //   bool emailExists = _auth.fetchSignInMethodsForEmail(email)
  // }

  Future getEmailPasswordLogin() {
    // TODO: implement getEmailPasswordLogin
    throw UnimplementedError();
  }
}
