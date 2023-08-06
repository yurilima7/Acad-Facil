import 'dart:developer';

import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Core/Notifier/app_status.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Repositoriess/disciplines/disciplines_repository_impl.dart';

class AddDisciplinesController extends AppStatus {
  Future<void> registerDiscipline(Disciplines discipline) async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      await DisciplinesRepositoryImpl().addDiscipline(discipline);

      success('Disciplina adicionada com sucesso!');
    } on AppException catch (e) {
      setError(e.message);
      log(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
