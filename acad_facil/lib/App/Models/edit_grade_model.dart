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
}