import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Utils/functions.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  Future<void> signInGoogle(AuthModel model) async {}

  Future<void> logout(AuthModel model) async {   
    try {
      Constants.auth.signOut();
      Functions().logoutApp(model);
    } catch (e) {
      Messages.showError(model.context, 'Falha no logout!');
    }
  }
}
