import 'package:acad_facil/Data/disciplinas_aleatorias.dart';
import 'package:acad_facil/MVC/Models/disciplinas.dart';
import 'package:flutter/material.dart';

class MateriaControler with ChangeNotifier {

  final List<Disciplinas> _disciplinas = disciplinasAleatorias;

  List<Disciplinas> get disciplinas => [..._disciplinas];
  
}
