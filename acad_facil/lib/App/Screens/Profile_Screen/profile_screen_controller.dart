import 'dart:developer';

import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Core/Notifier/app_status.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:acad_facil/App/Repositories/user/user_repository_impl.dart';

class ProfileScreenController extends AppStatus {
  Future<void> updateUserData(UserModel user) async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      await UserRepositoryImpl().updateUser(user);
      
      success('Dados de usuário atualizado com sucesso!');
    } on AppException catch (e) {
      setError(e.message);
      log(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
