import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';

class DisciplinesScreenController extends ChangeNotifier {
  String search = '';
  List<Disciplines> filtered = [];
  List<Disciplines> disciplines = [];

  void filter(String value) {
    filtered = disciplines
        .where((d) => d.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void add(List<Disciplines> disciplinesTotal) {
    disciplines = disciplinesTotal;
    notifyListeners();
  }
}
