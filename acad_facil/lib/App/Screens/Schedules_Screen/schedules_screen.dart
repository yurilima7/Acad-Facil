import 'package:acad_facil/App/Screens/Schedules_Screen/Widgets/schedules_card.dart';
import 'package:flutter/material.dart';

class SchedulesScreen extends StatelessWidget {
  const SchedulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List days = ['SEGUNDA', 'TERÇA', 'QUARTA', 'QUINTA', 'SEXTA'];

    return Padding(
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
            
              itemCount: days.length,
              itemBuilder: (context, i) => SchedulesCard(
                day: days.elementAt(i),
              ),
            ),
          ),
        ],
      ),
    );
  }
}