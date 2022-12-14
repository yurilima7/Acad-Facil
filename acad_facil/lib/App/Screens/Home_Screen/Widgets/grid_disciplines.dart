import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/discipline_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridDisciplines extends StatelessWidget {

  const GridDisciplines({ 
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerDisciplines = Provider.of<DisciplinesControler>(context);
    final List<Disciplines> disciplines = providerDisciplines.disciplines;

    return disciplines.isNotEmpty ? SizedBox(
      
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
      
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        
        itemCount: providerDisciplines.disciplinesCount <= 6 ? providerDisciplines.disciplinesCount : 6,
              itemBuilder: (context, i) => DisciplineCard(discipline: disciplines[i]),
      ),
    )
    : 
    SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      
      child: Center(
        child: Text(
          'Sem disciplinas no momento!',
          style: context.textStyles.secundaryTitle,
        ),
      ),
    );
  }
}