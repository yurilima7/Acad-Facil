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
              materia.nome,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),

            subtitle: Text(
              'Sala: ${materia.sala}',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
