import 'package:acad_facil/Data/disciplinas_aleatorias.dart';
import 'package:acad_facil/MVC/Models/disciplinas.dart';
import 'package:flutter/material.dart';

class DisciplinasControler with ChangeNotifier {

  List<Disciplinas> _disciplinas = [];

  List<Disciplinas> get disciplinas => [..._disciplinas];

  int get quantidadeDisciplinas {
    return _disciplinas.length;
  }

  Future<void> lerDisciplinas() async {
    _disciplinas = disciplinasAleatorias.map(
      (item) => Disciplinas(
        id: item.id,
        nome: item.nome,
        sala: item.sala,
        notas: item.notas,
        periodo: item.periodo,
        horario: item.horario,
        media: item.media,
      ),
    ).toList();

    notifyListeners();
  }
  
}
