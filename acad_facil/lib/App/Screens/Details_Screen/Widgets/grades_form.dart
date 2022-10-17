import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class GradesForm extends StatelessWidget {
  final int i;
  final double grade;

  const GradesForm({
    Key? key,
    required this.i,
    required this.grade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Nota $i', style: TextStyles.i.mainTitle,),

        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: ColorsStyles.secundary,
              borderRadius: BorderRadius.circular(20),
            ),
        
            child: Center(
              child: Text(
                '$grade',
                style: context.textStyles.grade,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
