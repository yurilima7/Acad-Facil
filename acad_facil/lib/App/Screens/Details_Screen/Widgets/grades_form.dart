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
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),

      child: Center(
        child: ListTile(
          title: Text(
            '$grade',
            style: TextStyles.i.grade,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}