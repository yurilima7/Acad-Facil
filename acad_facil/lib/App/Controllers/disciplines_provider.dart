import 'package:acad_facil/App/Models/add_schedule_model.dart';
import 'package:acad_facil/App/Models/disciplines.dart';

abstract class DisciplinesProvider {
  Future<void> loadDisciplines();
  Future<void> addDisciplines(Disciplines discipline);
  Future<void> deleteDisciplines(Disciplines discipline);
  Future<void> addGrades(
    String id,
    Map<String, double> grade,
    double avarage,
  );
  Future<void> addSchedules(AddScheduleModel model);
}
