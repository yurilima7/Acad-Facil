import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Utils/navigator_routes.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  Future<void> signInEmail(AuthModel model) async {
    String returnMessenger = "Falha na autenticação!";

    try {
      await Constants.auth.signInWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

      NavigatorRoutes().verify();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        returnMessenger = "Este e-mail não está cadastrado!";
      } else if (e.code == 'wrong-password') {
        returnMessenger = "Sua senha está incorreta, tente novamente!";
      }
      Messages.showError(returnMessenger);
    } catch (e) {
      Messages.showError(returnMessenger);
    }
  }

  Future<void> registerUser(AuthModel model) async {
    String returnMessenger = "Falha na autenticação!";

    try {
      UserCredential userCredential =
          await Constants.auth.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

      userCredential.user!.updateDisplayName(model.userName);

      NavigatorRoutes().loginScreen();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        returnMessenger = "Senha não aceita, crie uma mais forte!";
      } else if (e.code == 'email-already-in-use') {
        returnMessenger = "Este e-mail já está cadastrado!";
      }

      Messages.showError(returnMessenger);
    } catch (e) {
      Messages.showError(returnMessenger);
    }
  }

  Future<void> signInGoogle(AuthModel model) async {
    String returnMessenger = "Falha na autenticação!";

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await Constants.googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await Constants.auth.signInWithCredential(credential);

      NavigatorRoutes().verify();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        returnMessenger = "Este e-mail já está cadastrado!";
      } else if (e.code == 'invalid-credential') {
        returnMessenger = "Conta inválida!";
      }
      
      Messages.showError(returnMessenger);
    } catch (e) {
      
      Messages.showError(returnMessenger);
    }
  }

  Future<void> logout(String msg) async {
    try {
      await Constants.db.terminate();
      await Constants.db.clearPersistence();
      await Constants.googleSignIn.signOut();
      await Constants.auth.signOut();
      NavigatorRoutes().logoutApp(msg);
    } catch (e) {
      Messages.showError('Falha no logout!');
    }
  }
}
