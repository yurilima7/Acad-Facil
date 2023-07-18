import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Exceptions/auth_exception.dart';
import 'package:acad_facil/App/Core/Notifier/app_status.dart';
import 'package:acad_facil/App/Core/Utils/navigator_routes.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:acad_facil/App/repositories/auth/auth_repository_impl.dart';

class Auth extends AppStatus {
  Future<void> signInEmail(AuthModel model) async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      await AuthRepositoryImpl().login(model.email, model.password);

      success('Login realizado com sucesso!');
      NavigatorRoutes().verify();
    } on AuthException catch (e) {
      setError(e.message);
      
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> registerUser(AuthModel model) async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      await AuthRepositoryImpl().register(model.userName, model.email, model.password,);

      success('Conta criada com sucesso!');
      NavigatorRoutes().verify();
    } on AuthException catch (e) {
      setError(e.message); 
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> signInGoogle(AuthModel model) async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      await AuthRepositoryImpl().google();

      success('Login realizado com sucesso!');
      NavigatorRoutes().verify();
    } on AuthException catch (e) {
      setError(e.message); 
    } finally {
      hideLoading();
      notifyListeners();
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
