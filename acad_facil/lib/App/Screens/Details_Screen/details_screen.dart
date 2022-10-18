import 'package:acad_facil/App/Core/Widgets/floating_button.dart';
import 'package:acad_facil/App/Core/Widgets/information_card.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Screens/Details_Screen/Widgets/grid_grades.dart';
import 'package:acad_facil/App/Screens/Details_Screen/Widgets/grid_schedule.dart';
import 'package:acad_facil/App/Screens/Details_Screen/Widgets/local_avarage.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {

  const DetailsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Disciplines disciplines =
        ModalRoute.of(context)!.settings.arguments as Disciplines;

    return Scaffold(
      appBar: AppBar(
        title: Text(disciplines.name),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Padding(
          padding: const EdgeInsets.all(20.0),

          child: Wrap(
            runSpacing: MediaQuery.of(context).size.height * 0.06,

            children: [
              InformationCard(
                title: "Sala ${disciplines.classroom}",
                subTitle: "Periodo: ${disciplines.period}°",
                isCourse: false,
              ),

              GridGrades(disciplines: disciplines),
              GridSchedule(schedules: disciplines.schedule),

              LocalAvarage(avarage: disciplines.avarage,),
            ],
          ),
        ),
      ),

      floatingActionButton: const FloatingButton(),
    );
  }
}