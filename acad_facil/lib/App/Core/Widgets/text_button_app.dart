import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/alert.dart';
import 'package:flutter/material.dart';

class TextButtonApp extends StatelessWidget {
  final String title, message;
  final Function() action;
  final int position;
  final bool alert;

  const TextButtonApp({
    Key? key,
    required this.title,
    required this.action,
    this.position = 0,
    this.alert = false,
    this.message = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: alert 
        ? () => showDialog(
          context: context,
            builder: (_) => Alert(
              action: action,
              message: message,
              position: position,
            ),
          )
        : () => action(),
        
      child: Text(
        title,
        style: context.textStyles.secundaryTitle,
      ),
    );
  }
}
