import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:raro_budget/src/modules/login/login/login_respository.dart';
import 'package:raro_budget/src/shared/auth/auth_controller.dart';
import 'package:raro_budget/src/shared/connectivity/app_connectivity.dart';
import 'package:raro_budget/src/shared/widgets/custom_dialog/custom_dialog.dart';

class LoginController {
  LoginController(
    this.authController,
    this.loginRepository,
    this.appConnectivity,
  );

  final AuthController authController;
  final LoginRepository loginRepository;
  final AppConnectivity appConnectivity;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<bool> verifyEmail(String email) async {
    bool hasEmail = await authController.authRepository.hasEmail(email);
    return hasEmail;
  }

  Future<void> connection() async {
    await appConnectivity.checkConnection();
  }

  void login(String email, String password, BuildContext context) {
    connection().then(
      (_) => {
        if (appConnectivity.connectionResult != ConnectivityResult.none)
          {
            authController.authRepository
                .getEmailPasswordLogin(email, password)
                .then(
                  (value) => {
                    if (value)
                      {
                        authController.getUser().then(
                              (_) => Modular.to.navigate("/home"),
                            ),
                      }
                    else
                      {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialog(
                              title: "Credênciais inválidas",
                              subtitle: "Email ou senha incorreta",
                            );
                          },
                        ),
                      }
                  },
                )
          }
        else
          {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog(
                  title: "Sem conexão",
                  subtitle: "Verifique sua conexão com a internet",
                );
              },
            )
          }
      },
    );
  }

  void continueButtonFunction(BuildContext context) {
    connection().then(
      (_) => {
        if (appConnectivity.connectionResult != ConnectivityResult.none)
          {
            verifyEmail(emailController.text).then(
              (value) => {
                if (value)
                  {Modular.to.navigate("/login/existing_email")}
                else
                  {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          title: "Email não cadastrado",
                          subtitle: "O email inserido não está cadastrado",
                        );
                      },
                    ),
                  }
              },
            )
          }
        else
          {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog(
                  title: "Sem conexão",
                  subtitle: "Verifique sua conexão com a internet",
                );
              },
            )
          }
      },
    );
  }

  Future<void> loginWithGoogle() async {
    return await loginRepository.loginWithGoogle();
  }
}
