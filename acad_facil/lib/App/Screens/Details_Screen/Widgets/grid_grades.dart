import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Screens/Details_Screen/Widgets/grades_form.dart';
import 'package:flutter/material.dart';

class GridGrades extends StatelessWidget {
  final Disciplines disciplines;

  const GridGrades({
    super.key,
    required this.disciplines,
  });

  @override
  Widget build(BuildContext context) {
    final disciplinesCount = disciplines.grades.length;
    return SizedBox(
      
      child: disciplinesCount > 0 ? GridView.builder(
      
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
      
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,

        itemCount: disciplinesCount <= 5? disciplinesCount : 5,
          itemBuilder: (context, i) => GradesForm(
            i: i,
            discipline: disciplines,
          ),
      )
      :
      SizedBox(
        height: 250,
        child: Center(
          child: Text(
            'Sem notas no momento!',
            style: context.textStyles.secundaryTitle,
          ),
        ),
      ),
    );
  }
}