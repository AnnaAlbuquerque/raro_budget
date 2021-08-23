import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:raro_budget/src/shared/auth/auth_repository.dart';

class LoginRepository {
  AuthRepository authRepository;
  LoginRepository(
    this.authRepository,
  );

  Future<void> loginWithGoogle() async {
    try {
      final googleSignInAccount = await GoogleSignIn().signIn();

      final googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await authRepository.auth.signInWithCredential(credential);
      await authRepository.store
          .collection('users')
          .doc(authRepository.auth.currentUser!.uid)
          .set({
        'name': googleSignInAccount.displayName,
        'email': googleSignInAccount.email,
      });
    } catch (e) {
      throw e.toString();
    }
  }
}

//TODO: precisa checar email duplicado!
// aqui pode ir o login social do Google
// não deixei aqui o verifyEmail pois achei melhor colocar no campo de email do cadastro também, 
// caso o usuário tenha esquecido que um dia fez o cadastro, 
// o firebase na realidade tbm retorna que o email já existe e talz, mas é uma forma de 
// impedir o cadastro de ir p/ frente e tratar o erro