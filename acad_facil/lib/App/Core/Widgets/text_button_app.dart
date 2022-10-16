import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class TextButtonApp extends StatelessWidget {
  final String title;
  final Function() action;

  const TextButtonApp({
    Key? key,
    required this.title,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => action(),
      child: Text(
        title,
        style: context.textStyles.secundaryTitle,
      ),
    );
  }
}
