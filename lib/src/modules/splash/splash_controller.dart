import 'package:firebase_core/firebase_core.dart';
import 'package:mobx/mobx.dart';
import 'package:raro_budget/src/shared/enums/firebase_status.dart';

part 'splash_controller.g.dart';

class SplashController = SplashBase with _$SplashController;

abstract class SplashBase with Store {
  late final Future<FirebaseApp> firebaseApp;

  @observable
  FirebaseStatus firebaseStatus = FirebaseStatus.loading;

  @action
  Future<void> initializerFirebase() async {
    try {
      await Firebase.initializeApp();
      firebaseStatus = FirebaseStatus.success;
      print("CONEXÃO COM FIREBASE - SUCCESS");
    } catch (e) {
      firebaseStatus = FirebaseStatus.error;
      print("CONEXÃO COM FIREBASE - ERROR");
    }
  }
}
