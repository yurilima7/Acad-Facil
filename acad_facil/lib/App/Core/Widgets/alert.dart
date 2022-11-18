import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final Function() action;
  const Alert({
    Key? key,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorsStyles.primary,
      
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),

      title: Text('Deletar', style: context.textStyles.alertTitle,),

      content: Text(
        'Deseja deletar esta disciplina?',
        style: context.textStyles.secundaryTitle,
      ),

      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            'Cancelar',
            style: context.textStyles.mainTitle,
          ),
        ),

        TextButton(
          onPressed: () { 
            Navigator.pop(context, true);
            action();
          },
          child: Text(
            'OK',
            style: context.textStyles.mainTitle,
          ),
        ),
      ],
    );
  }
}
