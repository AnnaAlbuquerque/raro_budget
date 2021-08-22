import 'package:connectivity_plus/connectivity_plus.dart';

class AppConnectivity {
  ConnectivityResult connectionResult = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();

  Future<void> checkConnection() async {
    await Connectivity()
        .checkConnectivity()
        .then((value) => {connectionResult = value, print(value)});
  }
}
