import 'package:flutter/widgets.dart';

class Disciplines with ChangeNotifier{
  String id;
  String name;
  String classroom;
  int period;
  Map<String, double> grades;
  Map<String, String> schedule;
  double avarage;

  Disciplines({
    required this.id,
    required this.name,
    required this.classroom,
    required this.grades,
    required this.period,
    required this.schedule,
    required this.avarage,
  });
}
