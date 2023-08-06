import 'dart:developer';

import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Core/Notifier/app_status.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:acad_facil/App/Repositoriess/user/user_repository_impl.dart';

class RegisterDataController extends AppStatus {
  Future<void> registerData(UserModel user) async {
    if (user.period <= 10) {
      try {
        showLoadingAndResetState();
        notifyListeners();

        UserRepositoryImpl().addData(user);

        success('Dados inseridos com sucesso!');
      } on AppException catch (e) {
        setError(e.message);
        log(e.message);
      } finally {
        hideLoading();
        notifyListeners();
      }
    } else {
      setInfo('O máximo de períodos aceitavel é de 10!');
    }
  }
}
