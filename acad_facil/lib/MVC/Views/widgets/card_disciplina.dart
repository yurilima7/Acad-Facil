import 'package:acad_facil/MVC/Models/disciplinas.dart';
import 'package:acad_facil/MVC/Styles/estilos_texto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardDisciplina extends StatelessWidget {

  const CardDisciplina({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final disciplina = Provider.of<Disciplinas>(context, listen: false);

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
