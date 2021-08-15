import 'package:raro_budget/src/core/entities/user_model.dart';
import 'package:raro_budget/src/shared/enums/firebase_status.dart';

abstract class IAuthRepository {
  Future<void> initializer();

  ConnectionStatus getConnectionStatus();

  Future getEmailPasswordLogin();
  // Future<UserModel> getUser();
  // Future getGoogleLogin();
  // Future<String> getToken();
}
