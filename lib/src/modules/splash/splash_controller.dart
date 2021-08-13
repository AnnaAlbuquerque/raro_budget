import 'package:firebase_core/firebase_core.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_budget/src/shared/enums/firebase_status.dart';

class SplashController {
  late final Future<FirebaseApp> firebaseApp;

  @observable
  FirebaseStatus firebaseStatus = FirebaseStatus.loading;

  @action
  void initializerFirebase() async {
    try {
      await Firebase.initializeApp();
      firebaseStatus = FirebaseStatus.success;
      print("Conexão com firebase realizada");
    } catch (e) {
      firebaseStatus = FirebaseStatus.error;
      print("Conexão com firebase falhou");
    }
  }
}
