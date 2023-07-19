import 'package:acad_facil/App/Models/disciplines.dart';

abstract class DisciplinesRepository {
  Future<List<Disciplines>?> loadDisciplines();
}
