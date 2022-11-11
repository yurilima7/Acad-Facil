import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/functions.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';

class ModalAddDisciplines extends StatelessWidget {
  final Disciplines disciplines;
  const ModalAddDisciplines({Key? key, required this.disciplines,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: ColorsStyles.primary,
      padding: const EdgeInsets.all(20.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                'Adicionar Nota',
                style: context.textStyles.mainTitle,
              ),

              ElevatedButton(
                onPressed: () => Functions().addGrades(disciplines),
                style: context.buttonStyles.circleButton,
                child: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ],
      ),
    );  
  }
}
