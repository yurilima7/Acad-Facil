import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static Future<void> signInEmail(AuthModel model) async {
    String returnMessenger = "Falha na autenticação!";

    try {
      await Constants.auth.signInWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
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

  static Future<void> registerUser(AuthModel model) async {
    String returnMessenger = "Falha na autenticação!";

    try {
      UserCredential userCredential =
          await Constants.auth.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

      userCredential.user!.updateDisplayName(model.userName);

      await Constants.userRefence.add({
        'Name': model.userName,
      });
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

  static Future<void> signInGoogle(AuthModel model) async {}
  static Future<void> logout(AuthModel model) async {}
}
