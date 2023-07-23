import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final VoidCallback? function;
  final String message;
  final int position;

  const Alert({
    super.key,
    this.function,
    required this.message,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    List<String> title = ['Deletar', 'Encerrar Conta', 'Sair'];

    return AlertDialog(
      backgroundColor: ColorsStyles.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      title: Text(
        title[position],
        style: context.textStyles.titleLarge,
      ),
      content: Text(
        message,
        style: context.textStyles.secundaryTitle,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            'Cancelar',
            style: context.textStyles.titleMedium,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
            function!();
          },
          child: Text(
            'OK',
            style: context.textStyles.titleMedium,
          ),
        ),
      ],
    );
  }
}
