import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';

class DisciplineCard extends StatelessWidget {
  final Disciplines discipline;
  final List<Disciplines> disciplines;
  final VoidCallback? function;

  const DisciplineCard({
    super.key,
    required this.discipline, 
    required this.disciplines, this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,

      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                discipline.name,
                style: context.textStyles.titleSmall,
              ),
              subtitle: Text(
                'Sala: ${discipline.classroom}',
                style: context.textStyles.secundarySubTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
