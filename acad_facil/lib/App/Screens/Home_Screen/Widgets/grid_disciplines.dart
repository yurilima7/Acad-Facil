import 'package:acad_facil/App/Core/Utils/assets.dart';
import 'package:acad_facil/App/Core/Widgets/options_card.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Screens/Home_Screen/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridDisciplines extends StatelessWidget {

  const GridDisciplines({ 
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> assets = [
      Assets.notas,
      Assets.university,
      Assets.settings,
      Assets.user,
      Assets.exit,
    ];

    final List<String> titles = [
      'Suas Notas',
      'Disciplinas',
      'Opções',
      'Perfil',
      'Sair',
    ];

    final providerDisciplines = Provider.of<HomeController>(context);
    final List<Disciplines> disciplines = providerDisciplines.disciplines ?? [];

    return SizedBox(
      
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
      
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        
        itemCount: disciplines.isNotEmpty ? 5 : 0,
        itemBuilder: (context, i) => OptionsCard(
          path: assets[i],
          title: titles[i],
          subtitle:
              i > 1 ? '' : 'Disciplinas ${disciplines.length}',
          index: i,
          discipline: disciplines[i],
        ),
      ),
    );
    // child: ListView.builder(
    //   itemCount: 5,
    //   shrinkWrap: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemBuilder: (_, i) => OptionsCard(
    //       path: assets[i],
    //       title: titles[i],
    //       subtitle:
    //           i > 1 ? '' : 'Disciplinas ${disciplines.length}',
    //     ),
    //   ),
    // )
  }
}