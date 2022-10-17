import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/discipline_card.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridDisciplines extends StatelessWidget {

  const GridDisciplines({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerDisciplines = Provider.of<DisciplinesControler>(context);
    final List<Disciplines> disciplines = providerDisciplines.disciplines;
    
    return Expanded(
      child: disciplines.isNotEmpty ? GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
      
        itemCount: providerDisciplines.disciplinesCount ,
              itemBuilder: (context, i) => ChangeNotifierProvider.value(
                value: disciplines[i],
                child: const DisciplineCard(),
              ),
      )
      :
      Center(
        child: Text(
          'Sem disciplinas no momento!',
          style: context.textStyles.secundaryTitle,
        ),
      ),
    );
  }
}