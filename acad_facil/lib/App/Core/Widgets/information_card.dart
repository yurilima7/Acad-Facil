import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final String title;
  final String subTitle;

  const InformationCard({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
    
      color: Theme.of(context).colorScheme.secondary,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    
      child: Padding(
        padding: const EdgeInsets.all(10.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            ListTile(
              title: Row(
                children: [
                  Text(
                    title,
                    style: context.textStyles.bigTitle,
                  ),
                ],
              ),
              
              trailing: Icon(
                  Icons.school,
                  color: ColorsStyles.white,
                  size: 90,
              ),
            ),
    
            Padding(
              padding: const EdgeInsets.all(16.0),
    
              child: Text(
                subTitle,
                style: context.textStyles.secundaryTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}