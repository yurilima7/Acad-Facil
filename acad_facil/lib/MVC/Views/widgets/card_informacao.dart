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

      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 3.0, right: 3.0,),
        
        child: ListTile(
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

          subtitle: Row(
            children: [
              EstilosTexto.textNormalInter(titulo),
            ],
          ),
        ),
      ),
    );
  }
}