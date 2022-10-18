import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Screens/Details_Screen/Widgets/schedule_form.dart';
import 'package:flutter/material.dart';

class GridSchedule extends StatelessWidget {
  final Map<String, String> schedules;

  const GridSchedule({
    Key? key,
    required this.schedules,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: schedules.isNotEmpty ? GridView.builder(

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),

        physics: const NeverScrollableScrollPhysics(),

        itemCount: schedules.length,
          itemBuilder: (context, i) => Row(
            children: [
              ScheduleForm(
                day: schedules.keys.elementAt(i),
                hour: schedules.values.elementAt(i),
              ),
            ],
          ),
      )
      :
      Center(
        child: Text(
          'Sem aulas no momento!',
          style: context.textStyles.secundaryTitle,
        ),
      ),
    );
  }
}
