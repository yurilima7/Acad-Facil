import 'package:acad_facil/MVC/Models/materia.dart';
import 'package:flutter/material.dart';

class CardMateria extends StatelessWidget {
  final Materia materia;

  const CardMateria({
    Key? key,
    required this.materia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        
        color: Theme.of(context).colorScheme.secondary,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          
          children: [
            ListTile(
              title: Text(
                materia.nome,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16.0),
              
              child: Row(       
                children: [
                  
                  Text(
                    'Sala: ${materia.sala}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
