import 'dart:developer';

import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Core/Notifier/app_status.dart';
import 'package:acad_facil/App/Models/edit_grade_model.dart';
import 'package:acad_facil/App/repositories/disciplines/disciplines_repository_impl.dart';

class EditGradeController extends AppStatus {
  Future<bool> editGrade(EditGradeModel edit) async {
    bool result = false;

    try {
      showLoadingAndResetState();
      notifyListeners();

      edit.updateGrade(edit.newGrade, edit.position);
      final avarage = edit.avarageGrades;

      await DisciplinesRepositoryImpl()
          .updateGrade(edit.disciplineId, edit.grades, avarage);

      success('Atualização da nota realizada com sucesso!');
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

  Future<bool> removeGrade(EditGradeModel edit) async {
    bool result = false;

    try {
      showLoadingAndResetState();
      notifyListeners();

      edit.removeGrade(edit.newGrade, edit.position);
      final avarage = edit.avarageGrades;
      
      await DisciplinesRepositoryImpl()
          .updateGrade(edit.disciplineId, edit.grades, avarage);

      success('Remoção da nota realizada com sucesso!');
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
