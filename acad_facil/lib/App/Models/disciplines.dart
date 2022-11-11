import 'package:flutter/widgets.dart';

class Disciplines with ChangeNotifier{
  String id;
  String name;
  String classroom;
  int period;
  List grades;
  double avarage;

  Disciplines({
    required this.id,
    required this.name,
    required this.classroom,
    required this.grades,
    required this.period,
    required this.avarage,
  });
}
