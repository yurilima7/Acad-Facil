import 'dart:developer';

import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Core/Notifier/app_status.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:acad_facil/App/repositories/user/user_repository_impl.dart';

class ProfileScreenController extends AppStatus {
  Future<bool> updateUserData(UserModel user) async {
    bool result = false;
    try {
      showLoadingAndResetState();
      notifyListeners();

      await UserRepositoryImpl().updateUser(user);
      
      success('Dados de usuário atualizado com sucesso!');
      result = true;
    } on AppException catch (e) {
      setError(e.message);
      log(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }

    return result;
  }
}
