import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/alert.dart';
import 'package:flutter/material.dart';

class TextButtonApp extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? function;
  final int position;
  final bool alert;

  const TextButtonApp({
    super.key,
    required this.title,
    this.function,
    this.position = 0,
    this.alert = false,
    this.message = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: alert 
        ? () => showDialog(
          context: context,
            builder: (_) => Alert(
              function: function,
              message: message,
              position: position,
            ),
          )
        : function,
        
      child: Text(
        title,
        style: context.textStyles.secundaryTitle,
      ),
    );
  }
}
