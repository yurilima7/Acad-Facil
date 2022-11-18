import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/discipline_card.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';

class GridDisciplines extends StatefulWidget {
  final List<Disciplines> disciplines;
  final String search;

  const GridDisciplines({
    Key? key,
    required this.disciplines,
    required this.search,
  }) : super(key: key);

  @override
  State<GridDisciplines> createState() => _GridDisciplinesState();
}

class _GridDisciplinesState extends State<GridDisciplines> {
  @override
  Widget build(BuildContext context) {
    if (widget.disciplines.isEmpty) {
      return Expanded(
        child: Center(
          child: Text(
            'Sem disciplinas no momento!',
            style: context.textStyles.secundaryTitle,
          ),
        ),
      );
    } else {
      List<Disciplines> filtered = widget.disciplines
          .where(
              (d) => d.name.toLowerCase().contains(widget.search.toLowerCase()))
          .toList();

      return Expanded(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 10.0,

          children: List.generate(
            filtered.length,
            (i) => DisciplineCard(discipline: filtered[i]),
          ),
        ),
      );
    }
  }
}
