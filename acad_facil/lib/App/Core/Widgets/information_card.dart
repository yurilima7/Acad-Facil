import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final String title;
  const InformationCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
    
        color: Theme.of(context).colorScheme.secondary,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            ListTile(
              title: Row(
                children: [
                  Text(
                    'Curso:',
                    style: context.textStyles.bigTitle,
                  ),
                ],
              ),
              
              trailing: const Icon(
                Icons.school,
                color: Colors.white,
                size: 90,
              ),
            ),
    
            Padding(
              padding: const EdgeInsets.all(16.0),
    
              child: Text(
                title,
                style: context.textStyles.secundaryTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}