import 'package:acad_facil/MVC/Models/usuario.dart';
import 'package:acad_facil/MVC/Models/usuario_funcoes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsuarioController {
  
  Usuario usuario(BuildContext context){
    final provider = Provider.of<UsuarioFuncoes>(context);
    return provider.usuario;
  }
}