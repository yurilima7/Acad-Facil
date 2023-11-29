import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Models/edit_grade_model.dart';
import 'package:flutter/material.dart';

class GradesForm extends StatelessWidget {
  final int i;
  final Disciplines discipline;

  const GradesForm({
    super.key,
    required this.i,
    required this.discipline,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        AppRoutes.editGrade,
        arguments: EditGradeModel(
          disciplineId: discipline.id,
          grades: discipline.grades,
          newGrade: discipline.grades.elementAt(i),
          position: i,
        ),
      ),

      borderRadius: BorderRadius.circular(20.0),

      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Center(
          child: ListTile(
            title: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'N${i + 1}: ',
                    style: TextStyles.i.cardTitle.copyWith(color: ColorsStyles.white,),
                  ),
                  TextSpan(
                      text: '${discipline.grades.elementAt(i)}',
                      style: TextStyles.i.cardTitle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
