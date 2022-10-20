import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisciplineCard extends StatelessWidget {

  const DisciplineCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final discipline = Provider.of<Disciplines>(context, listen: false);

    void nextScreen(){
      Navigator.of(context).pushNamed(
        AppRoutes.details,
        arguments: discipline,
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
                discipline.name,
                style: context.textStyles.mainCardTitle,
              ),
    
              subtitle: Text(
                'Sala: ${discipline.classroom}',
                style: context.textStyles.secundarySubTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}