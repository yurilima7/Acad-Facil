import 'package:acad_facil/App/Core/Exceptions/auth_exception.dart';
import 'package:acad_facil/App/Core/Notifier/app_status.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:acad_facil/App/Repositories/auth/auth_repository_impl.dart';

class AuthController extends AppStatus {
  Future<void> signInEmail(AuthModel model) async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      await AuthRepositoryImpl().login(model.email, model.password);

      success('Login realizado com sucesso!');
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

      await AuthRepositoryImpl().register(
        model.userName,
        model.email,
        model.password,
      );

      success('Conta criada com sucesso!');
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> signInGoogle() async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      await AuthRepositoryImpl().google();

      success('Login realizado com sucesso!');
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
