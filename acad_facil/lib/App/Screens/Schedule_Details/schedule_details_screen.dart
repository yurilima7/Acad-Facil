import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Screens/Schedule_Details/Widgets/day_schedules_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleDetailsScreen extends StatelessWidget {
  const ScheduleDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String day = ModalRoute.of(context)!.settings.arguments as String;
    final providerDisciplines = Provider.of<DisciplinesControler>(context);
    final listSchedules = providerDisciplines.disciplinesDay(day.substring(0,3));
    final listNames = providerDisciplines.disciplineSchedule(day.substring(0,3));

    return Scaffold(
      appBar: AppBar(
        title: Text(day),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20,),
        
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                ),
              
                itemCount: listNames.length,
                itemBuilder: (context, i) => DaySchedulesCard(
                  disciplineName: listNames[i],
                  schedule: listSchedules[i],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
