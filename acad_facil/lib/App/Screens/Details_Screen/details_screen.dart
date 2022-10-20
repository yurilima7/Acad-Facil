import 'package:acad_facil/App/Core/Styles/text_styles.dart';
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

      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: 10,
        ),

        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
            
                child: Wrap(
                  runSpacing: MediaQuery.of(context).size.height * 0.06,
            
                  children: [
                    InformationCard(
                      title: "Sala ${disciplines.classroom}",
                      subTitle: "Periodo: ${disciplines.period}°",
                      isCourse: false,
                    ),
            
                    Wrap(
                      alignment: WrapAlignment.start,
                      runSpacing: 9,
            
                      children: [
                        Text('Notas', style: context.textStyles.mainTitle,),
                        GridGrades(disciplines: disciplines),
                      ],
                    ),
                    
                    Wrap(
                      alignment: WrapAlignment.start,
                      runSpacing: 9,
            
                      children: [
                        Text('Aulas', style: context.textStyles.mainTitle,),
                        GridSchedule(schedules: disciplines.schedule),
                      ],
                    ),
                               
                  ],
                ),
              ),
            ),
            
            LocalAvarage(avarage: disciplines.avarage,),
          ],
        ),
      ),

      floatingActionButton: const FloatingButton(),
    );
  }
}