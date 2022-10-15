import 'package:acad_facil/MVC/Controllers/disciplines_controller.dart';
import 'package:acad_facil/MVC/Models/disciplines.dart';
import 'package:acad_facil/MVC/Styles/text_styles.dart';
import 'package:acad_facil/MVC/Views/Widgets/discipline_card.dart';
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

    return SizedBox(
      height: 380,
      child: disciplines.isNotEmpty ? GridView.builder(
      
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
      
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
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