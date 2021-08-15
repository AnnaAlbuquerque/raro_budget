import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:raro_budget/src/shared/auth/repositories/auth_repository_interface.dart';
import 'package:raro_budget/src/shared/enums/firebase_status.dart';

class AuthRepositoryFirebase implements IAuthRepository {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  late ConnectionStatus firebaseConnectionStatus;

  @override
  Future<void> initializer() async {
    try {
      await Firebase.initializeApp();
      firebaseConnectionStatus = ConnectionStatus.success;
      print("CONEXÃO COM FIREBASE - SUCCESS");
    } catch (e) {
      firebaseConnectionStatus = ConnectionStatus.error;
      print("CONEXÃO COM FIREBASE - ERROR");
    }
  }

  @override
  ConnectionStatus getConnectionStatus() {
    return firebaseConnectionStatus;
  }

  @override
  Future getEmailPasswordLogin() {
    // TODO: implement getEmailPasswordLogin
    throw UnimplementedError();
  }
}
