import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';

class DisciplinesScreenController extends ChangeNotifier {
  List<Disciplines> filtered = [];
  List<Disciplines> _disciplines = [];
  final List<int> _periods = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
  int _periodNow = 0;

  int get period => _periodNow;

  List<int> get periodsWithoutZero =>
      _periods.where((period) => period != 0 && period <= _periodNow).toList();
  
  void updatePeriod(int updade) {
    if (updade == 0) {
      filtered = _disciplines;
    } else {
      filtered = _disciplines.where((d) => d.period == updade).toList();
    }
    notifyListeners();
  }

  void filter(String value) {
    filtered = _disciplines
        .where((d) => d.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  /// Adiciona as disciplinas nas listas
  void add(List<Disciplines> disciplinesTotal, int period) {
    _disciplines = disciplinesTotal;
    filtered = disciplinesTotal.where((d) => d.period == period).toList();
    _periodNow = period;
    notifyListeners();
  }
}
