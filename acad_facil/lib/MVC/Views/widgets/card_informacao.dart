import 'package:acad_facil/MVC/Views/widgets/estilos_texto.dart';
import 'package:flutter/material.dart';

class CardInformacoes extends StatelessWidget {
  final String titulo;
  const CardInformacoes({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Card(

      color: Theme.of(context).colorScheme.secondary,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          ListTile(
            title: Row(
              children: const [
                Text(
                  'Curso:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),

            child: EstilosTexto.textNormalInter(titulo),
          ),
        ],
      ),
    );
  }
}