import 'package:flutter/material.dart';

class EditGradeModel with ChangeNotifier {
  final String disciplineId;
  final List grades;
  final double newGrade;
  final int position;

  EditGradeModel({
    required this.disciplineId,
    required this.grades,
    required this.newGrade,
    required this.position,
  });

  void updateGrade(double grade, int pos) {
    grades[pos] = grade;
  }

  void removeGrade(double grade, int pos) {
    grades.removeAt(pos);
  }

  double get avarageGrades {
    return grades.reduce((sum, element) => sum + element) / grades.length;
  }
}
