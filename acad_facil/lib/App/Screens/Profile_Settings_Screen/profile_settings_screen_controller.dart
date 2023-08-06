import 'dart:developer';

import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Core/Notifier/app_status.dart';
import 'package:acad_facil/App/Repositoriess/user/user_repository_impl.dart';
import 'package:acad_facil/App/Repositoriess/disciplines/disciplines_repository_impl.dart';

class ProfileSettingsScreenController extends AppStatus {
  Future<void> deleteUser() async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      await UserRepositoryImpl().deleteUser();

      success('Conta encerrada com sucesso!');
    } on AppException catch (e) {
      setError(e.message);
      log(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> removeAllDisciplines() async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      await DisciplinesRepositoryImpl().deleteAllDisciplines();

      success('Todas as disciplinas deletadas com sucesso!');
    } on AppException catch (e) {
      setError(e.message);
      log(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
