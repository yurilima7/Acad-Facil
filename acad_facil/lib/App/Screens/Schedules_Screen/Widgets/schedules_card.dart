import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:flutter/material.dart';

class SchedulesCard extends StatelessWidget {
  final String day;
  const SchedulesCard({Key? key, required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void nextScreen(){
      Navigator.of(context).pushNamed(
        AppRoutes.scheduleDetails,
        arguments: day,
      );
    }

    return InkWell(
      onTap: () => nextScreen(),
      child: Card(
    
        color: Theme.of(context).colorScheme.secondary,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            ListTile(
              title: Text(
                day,
                style: context.textStyles.mainCardTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
