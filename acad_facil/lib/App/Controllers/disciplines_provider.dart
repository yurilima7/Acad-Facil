import 'package:acad_facil/App/Models/disciplines.dart';

abstract class DisciplinesProvider {
  Future<void> loadDisciplines();
  Future<void> addDisciplines(Disciplines discipline);
  Future<void> editDisciplines(Disciplines discipline);
  Future<void> deleteDisciplines(Disciplines discipline);
  List disciplinesDay(String day);
  List disciplineSchedule(String day);
}
