import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';

class DisciplinesScreenController extends ChangeNotifier {
  List<Disciplines> filtered = [];
  List<Disciplines> _disciplines = [];
  final List<int> _periods = [0,1,2,3,4,5,6,7,8,9,10];
  int _periodNow = 0;
  int periodSelected = 0;

  int get period => _periodNow;

  List<int> get periodsWithoutZero =>
      _periods.where((period) => period != 0 && period <= _periodNow).toList();
  
  /// ATUALIZA O PERÍODO DO ESTUDANTE PARA EXIBIR AS DISCIPLINAS DELE NO MESMO
  void updatePeriod(int update) {
    if (update == 0) {
      filtered = _disciplines;
      periodSelected = 0;
    } else {
      filtered = _disciplines.where((d) => d.period == update).toList();
      periodSelected = update;
    }
    notifyListeners();
  }

  /// FUNÇÃO DE FILTRO DA SEARCH
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
    periodSelected = period;
    notifyListeners();
  }
}
