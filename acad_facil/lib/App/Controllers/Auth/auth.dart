import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Utils/functions.dart';
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

      Functions().verify(model);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        returnMessenger = "Este e-mail não está cadastrado!";
      } else if (e.code == 'wrong-password') {
        returnMessenger = "Sua senha está incorreta, tente novamente!";
      }
      Messages.showError(model.context, returnMessenger);
    } catch (e) {
      Messages.showError(model.context, returnMessenger);
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

      Functions().loginScreen(model);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        returnMessenger = "Senha não aceita, crie uma mais forte!";
      } else if (e.code == 'email-already-in-use') {
        returnMessenger = "Este e-mail já está cadastrado!";
      }

      Messages.showError(model.context, returnMessenger);
    } catch (e) {
      Messages.showError(model.context, returnMessenger);
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

      Functions().verify(model);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        returnMessenger = "Este e-mail já está cadastrado!";
      } else if (e.code == 'invalid-credential') {
        returnMessenger = "Conta inválida!";
      }
      
      Messages.showError(model.context, returnMessenger);
    } catch (e) {
      
      Messages.showError(model.context, returnMessenger);
    }
  }

  Future<void> logout(AuthModel model) async {
    try {
      Constants.googleSignIn.signOut();
      Constants.auth.signOut();
      Functions().logoutApp(model);
    } catch (e) {
      Messages.showError(model.context, 'Falha no logout!');
    }
  }
}
