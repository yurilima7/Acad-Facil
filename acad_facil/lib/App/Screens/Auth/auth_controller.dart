import 'package:acad_facil/App/Core/Exceptions/auth_exception.dart';
import 'package:acad_facil/App/Core/Notifier/app_status.dart';
import 'package:acad_facil/App/Core/Utils/navigator_routes.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:acad_facil/App/repositories/auth/auth_repository_impl.dart';

class AuthController extends AppStatus {
  Future<bool> signInEmail(AuthModel model) async {
    bool result = false;

    try {
      showLoadingAndResetState();
      notifyListeners();

      await AuthRepositoryImpl().login(model.email, model.password);

      success('Login realizado com sucesso!');
      result = true;
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
    return result;
  }

  Future<bool> registerUser(AuthModel model) async {
    bool result = false;

    try {
      showLoadingAndResetState();
      notifyListeners();

      await AuthRepositoryImpl().register(
        model.userName,
        model.email,
        model.password,
      );

      success('Conta criada com sucesso!');
      result = true;
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }

    return result;
  }

  Future<bool> signInGoogle(AuthModel model) async {
    bool result = false;

    try {
      showLoadingAndResetState();
      notifyListeners();

      await AuthRepositoryImpl().google();

      success('Login realizado com sucesso!');
      result = true;
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }

    return result;
  }

  Future<void> logout(String msg) async {
    try {
      await AuthRepositoryImpl().logoutApp();
      NavigatorRoutes().logoutApp(msg);
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      notifyListeners();
    }
  }
}
