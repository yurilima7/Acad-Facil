import 'package:acad_facil/App/Controllers/disciplines_provider.dart';
import 'package:acad_facil/App/Core/Data/dummy_disciplines.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';

class DisciplinesControler with ChangeNotifier implements DisciplinesProvider {

  List<Disciplines> _disciplines = [];

  List<Disciplines> get disciplines => [..._disciplines];

  int get disciplinesCount {
    return _disciplines.length;
  }

  @override
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
  
  @override
  Future<void> addDisciplines() {
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteDisciplines() {
    throw UnimplementedError();
  }
  
  @override
  Future<void> editDisciplines() {
    throw UnimplementedError();
  }
  
}
