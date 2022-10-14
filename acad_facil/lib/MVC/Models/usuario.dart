import 'package:flutter/widgets.dart';

class Usuario with ChangeNotifier{
  String id;
  String nome;
  String curso;
  int periodo;

  Usuario({
    required this.id,
    required this.nome,
    required this.curso,
    required this.periodo,
  });
}