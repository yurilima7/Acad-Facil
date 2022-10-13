import 'package:acad_facil/MVC/Models/disciplinas.dart';
import 'package:acad_facil/MVC/styles/estilos_texto.dart';
import 'package:flutter/material.dart';

class CardDisciplina extends StatelessWidget {
  final Disciplinas disciplina;

  const CardDisciplina({
    Key? key,
    required this.disciplina,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      color: Theme.of(context).colorScheme.secondary,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          ListTile(
            title: Text(
              disciplina.nome,
              style: context.estilosTexto.tituloPrincipalCard,
            ),

            subtitle: Text(
              'Sala: ${disciplina.sala}',
              style: context.estilosTexto.subTituloSecundario,
            ),
          ),
        ],
      ),
    );
  }
}
