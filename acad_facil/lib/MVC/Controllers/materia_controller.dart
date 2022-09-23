import 'package:acad_facil/MVC/Models/materia.dart';
import 'package:acad_facil/MVC/Models/materia_funcoes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MateriaControler {
  
  List<Materia> listaMaterias(BuildContext context) {
    final provider = Provider.of<MateriaFuncoes>(context);
    return provider.materias;
  }
}
