import 'package:acad_facil/Data/materias_aleatorias.dart';
import 'package:acad_facil/MVC/Models/materia.dart';
import 'package:flutter/material.dart';

class MateriaFuncoes with ChangeNotifier{
  final List<Materia> _materias = materiasAleatorias;

  List<Materia> get materias => [..._materias];
}