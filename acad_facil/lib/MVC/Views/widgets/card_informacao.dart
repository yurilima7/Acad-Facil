import 'package:flutter/material.dart';

class CardInformacoes extends StatelessWidget {
  const CardInformacoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(

        color: Theme.of(context).colorScheme.secondary,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          
          children:  [
            const ListTile(
              title: Text(
                'Curso:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16.0),
              
              child: Row(
                children: const [
                  Text(
                    'Ciência da Computação',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
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