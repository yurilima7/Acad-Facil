import 'dart:developer';

import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Core/Notifier/app_status.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Repositories/disciplines/disciplines_repository_impl.dart';

class DetailsScreenController extends AppStatus {
  List<Disciplines> listDisciplines = [];
  Disciplines? discipline;
  int? period;

  /// FUNÇÃO QUE REMOVE UMA DISCIPLINA DO BANCO DE DADOS
  Future<void> removeDiscipline(
      List<Disciplines> listDisciplines, Disciplines discipline) async {

    try {
      showLoadingAndResetState();
      notifyListeners();

      await DisciplinesRepositoryImpl().deleteDiscipline(discipline.id);

      success('Disciplina deletada com sucesso!');
    } on AppException catch (e) {
      setError(e.message);
      log(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  /// FUNÇÃO RESPONSÁVEL POR INICIAR OS DADOS RECEBIDOS NA TELA
  void addDataDiscipline(
      List<Disciplines> list, Disciplines disciplineData, int nowPeriod) {
    discipline = disciplineData;
    listDisciplines = list;
    period = nowPeriod;
    notifyListeners();
  }
}
