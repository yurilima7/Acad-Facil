import 'package:acad_facil/MVC/Views/widgets/estilos_texto.dart';
import 'package:flutter/material.dart';

class HorarioForm extends StatelessWidget {
  const HorarioForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          width: 35,
          
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),

            borderRadius: BorderRadius.circular(20.0)
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              EstilosTexto.textNormalBebas('SEG'),
              EstilosTexto.textNormalBebas('4'),
            ],
          ),
        ),
      ],
    );
  }
}