import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Screens/Details_Screen/Widgets/grades_form.dart';
import 'package:flutter/material.dart';

class GridGrades extends StatelessWidget {
  final Disciplines disciplines;

  const GridGrades({
    Key? key,
    required this.disciplines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final disciplinesCount = disciplines.grades.length;

    return SizedBox(
      height: 180,
      child: disciplinesCount > 0 ? GridView.builder(
      
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
      
        physics: const NeverScrollableScrollPhysics(),

        itemCount: disciplinesCount <= 5? disciplinesCount : 5,
          itemBuilder: (context, i) => GradesForm(
            i: i + 1,
            grade: disciplines.grades.values.elementAt(i),
          ),
      )
      :
      Center(
        child: Text(
          'Sem notas no momento!',
          style: context.textStyles.secundaryTitle,
        ),
      ),
    );
  }
}