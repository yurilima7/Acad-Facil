
import 'package:acad_facil/App/Models/disciplines.dart';

abstract class DisciplinesProvider {
  Future<void> loadDisciplines();
  Future<void> addDisciplines(Disciplines discipline);
  Future<void> deleteDisciplines(Disciplines discipline);
  Future<void> addGrades(String id, List<dynamic> grade, double newGrade);
  Future<void> editGrade(String id, List<dynamic> grade, double newGrade, int position);
  Future<void> editDiscipline(Disciplines discipline);
  Future<void> deleteData();
}
