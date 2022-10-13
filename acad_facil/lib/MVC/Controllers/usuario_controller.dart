import 'package:acad_facil/Data/usuario_aleatorio.dart';
import 'package:acad_facil/MVC/Models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioController with ChangeNotifier {

  final Usuario _usuario = usuarioAleatorio;
  Usuario get usuario => _usuario;
  
}