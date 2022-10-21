abstract class DisciplinesProvider {
  Future<void> loadDisciplines();
  Future<void> addDisciplines();
  Future<void> editDisciplines();
  Future<void> deleteDisciplines();
  List disciplinesDay(String day);
  List disciplineSchedule(String day);
}
