import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/discipline_card.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridDisciplines extends StatelessWidget {
  final List<Disciplines> disciplines;
  final String search;

  const GridDisciplines({
    Key? key,
    required this.disciplines,
    required this.search,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (disciplines.isEmpty) {
      return Expanded(
        child: Center(
          child: Text(
            'Sem disciplinas no momento!',
            style: context.textStyles.secundaryTitle,
          ),
        ),
      );
    }
    else {
      List<Disciplines> filtered = disciplines.where((d) => 
        d.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  
      return Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
          ),
          
          itemCount: filtered.length ,
                itemBuilder: (context, i) => ChangeNotifierProvider.value(
                  value: filtered[i],
                  child: const DisciplineCard(),
                ),
        ),
      );
    }
  }
}