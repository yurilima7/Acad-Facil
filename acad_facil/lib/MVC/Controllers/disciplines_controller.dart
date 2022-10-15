import 'package:acad_facil/Data/dummy_disciplines.dart';
import 'package:acad_facil/MVC/Models/disciplines.dart';
import 'package:flutter/material.dart';

class DisciplinesControler with ChangeNotifier {

  List<Disciplines> _disciplines = [];

  List<Disciplines> get disciplines => [..._disciplines];

  int get disciplinesCount {
    return _disciplines.length;
  }

  Future<void> loadDisciplines() async {
    _disciplines = dummyDisciplines.map(
      (item) => Disciplines(
        id: item.id,
        name: item.name,
        classroom: item.classroom,
        grades: item.grades,
        period: item.period,
        schedule: item.schedule,
        avarage: item.avarage,
      ),
    ).toList();

    notifyListeners();
  }
  
}
