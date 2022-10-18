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
    return Container(
      width: 40,

      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),

        borderRadius: BorderRadius.circular(20.0)
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            day,
            style: context.textStyles.mainTitle,
          ),
          // Text(
          //   hour,
          //   style: context.textStyles.mainTitle,
          // ),
        ],
      ),
    );
  }
}