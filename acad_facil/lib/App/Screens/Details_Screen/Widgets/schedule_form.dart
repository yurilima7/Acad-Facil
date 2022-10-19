import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class ScheduleForm extends StatelessWidget {
  final String day;
  final String hour;

  const ScheduleForm({
    super.key,
    required this.day,
    required this.hour,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsStyles.secundary,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),

      child: Center(
        child: ListTile(
          title: Text(
            day,
            style: TextStyles.i.grade,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
