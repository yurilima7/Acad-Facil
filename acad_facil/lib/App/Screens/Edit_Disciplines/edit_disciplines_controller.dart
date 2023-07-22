import 'dart:developer';

import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Core/Notifier/app_status.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/repositories/disciplines/disciplines_repository_impl.dart';

class EditDisciplinesController extends AppStatus {
  Future<bool> editDiscipline(Disciplines discipline) async {
    bool result = false;
    try {
      showLoadingAndResetState();
      notifyListeners();

      await DisciplinesRepositoryImpl().updateDiscipline(discipline);

      success('Update de disciplina realizado com sucesso!');
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
