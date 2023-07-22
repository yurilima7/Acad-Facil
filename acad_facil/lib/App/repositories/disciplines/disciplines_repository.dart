import 'package:acad_facil/App/Models/disciplines.dart';

abstract class DisciplinesRepository {
  Future<List<Disciplines>?> loadDisciplines();
  Future<void> deleteDiscipline(String id);
  Future<void> addGrades(String id, List<dynamic> grades, double avarage);
  Future<void> updateDiscipline(Disciplines discipline);
  Future<void> updateGrade(String id, List<dynamic> grades, double avarage);
}
