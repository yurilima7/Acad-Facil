import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/navigator_routes.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => NavigatorRoutes().addDisciplines(),
      style: context.buttonStyles.buttonApp,
      child: Text(
        'Adicionar Disciplina',
        style: context.textStyles.titleMedium.copyWith(
          color: ColorsStyles.primary,
        ),
      ),
    );
  }
}
