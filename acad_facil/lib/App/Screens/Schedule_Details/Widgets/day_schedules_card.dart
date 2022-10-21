import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class DaySchedulesCard extends StatelessWidget {
  final String disciplineName;
  final String schedule;

  const DaySchedulesCard({
    Key? key,
    required this.disciplineName,
    required this.schedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card( 
      color: Theme.of(context).colorScheme.secondary,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          ListTile(
            title: Text(
              disciplineName,
              style: context.textStyles.mainCardTitle,
            ),
  
            subtitle: Text(
              schedule,
              style: context.textStyles.secundarySubTitle,
            ),
          ),
        ],
      ),
    );
  }
}
