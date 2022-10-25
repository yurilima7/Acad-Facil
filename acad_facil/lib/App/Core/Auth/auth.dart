import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  
  static Future<bool> signInEmail(AuthModel model) async {
    String returnMessenger = "Falha na autenticação!";
    bool result = false;

    try {
      await Constants.auth.signInWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

      result = true;
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

    return result;
  }

  static Future<bool> registerUser(AuthModel model) async {
    String returnMessenger = "Falha na autenticação!";
    bool result = false;

    try {
      UserCredential userCredential =
          await Constants.auth.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

      userCredential.user!.updateDisplayName(model.userName);

      await Constants.userRefence.doc(userCredential.user!.uid).set({
        'name': model.userName,
      });

      result = true;
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

    return result;
  }

  static Future<void> signInGoogle(AuthModel model) async {}
  
  static Future<void> logout(AuthModel model) async {
    Constants.auth.signOut();
    Messages.showSuccess(model.context, 'Logout com sucesso!');
  }
}
