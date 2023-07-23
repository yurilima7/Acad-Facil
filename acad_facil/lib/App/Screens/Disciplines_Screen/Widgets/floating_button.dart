import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final VoidCallback? function;
  final String title;

  const FloatingButton({
    super.key,
    this.function,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: context.buttonStyles.buttonApp,
      child: Text(
        title,
        style: context.textStyles.titleMedium.copyWith(
          color: ColorsStyles.primary,
        ),
      ),
    );
  }
}
