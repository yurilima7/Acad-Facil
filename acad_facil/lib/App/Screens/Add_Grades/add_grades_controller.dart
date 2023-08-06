import 'dart:developer';

import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Core/Notifier/app_status.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Repositoriess/disciplines/disciplines_repository_impl.dart';

class AddGradesController extends AppStatus {
  Future<void> addNewGrade(Disciplines discipline, double newGrade) async {
    if (discipline.grades.length == 5) {
      setInfo('Máximo de 5 notas já alcançado!');
    } else {
      try {
        showLoadingAndResetState();
        notifyListeners();

        discipline.newGrade(newGrade);
        final avarage = discipline.avarageGrades;

        await DisciplinesRepositoryImpl()
            .addGrades(discipline.id, discipline.grades, avarage);

        success('Nota adicionada com sucesso!');
      } on AppException catch (e) {
        setError(e.message);
        log(e.message);
      } finally {
        hideLoading();
        notifyListeners();
      }
    }
  }
}
