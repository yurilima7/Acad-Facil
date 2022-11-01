import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';

abstract class DisciplinesProvider {
  Future<void> loadDisciplines();
  Future<void> addDisciplines(Disciplines discipline, bool mounted, BuildContext context,);
  Future<void> editDisciplines(Disciplines discipline);
  Future<void> deleteDisciplines(Disciplines discipline);
  Future<void> addGrades(String id,  Map<String, double> grade, double avarage, bool mounted, BuildContext context,);
  List disciplinesDay(String day);
  List disciplineSchedule(String day);
}
