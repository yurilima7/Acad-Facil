import 'package:acad_facil/MVC/Controllers/disciplinas_controller.dart';
import 'package:acad_facil/MVC/Models/disciplinas.dart';
import 'package:acad_facil/MVC/Views/widgets/card_disciplina.dart';
import 'package:acad_facil/MVC/Styles/estilos_texto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisciplinasGrid extends StatelessWidget {

  const DisciplinasGrid({ 
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerDisciplinas = Provider.of<DisciplinasControler>(context);
    final List<Disciplinas> disciplinas = providerDisciplinas.disciplinas;

    return SizedBox(
      height: 380,
      child: disciplinas.isNotEmpty ? GridView.builder(
      
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
      
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
              itemBuilder: (context, i) => ChangeNotifierProvider.value(
                value: disciplinas[i],
                child: const CardDisciplina(),
              ),
      )
      : 
      Center(
        child: Text(
          'Sem disciplinas no momento!',
          style: context.estilosTexto.tituloSecundario,
        ),
      ),
    );
  }
}