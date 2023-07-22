import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback? action;
  final bool? description;
  final bool? error;

  const Button({
    super.key,
    required this.action,
    required this.title,
    this.description = false, 
    this.error = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Visibility(
        visible: !description!,

        replacement: ElevatedButton(
          onPressed: action,
          style: context.buttonStyles.buttonApp.copyWith(
            backgroundColor: MaterialStatePropertyAll(
              error! ? ColorsStyles.errors : ColorsStyles.secundary,
            ),
          ),
          child: Text(
            title,
            style: context.textStyles.titleLarge.copyWith(
              color: ColorsStyles.white,
            ),
          ),
        ),

        child: ElevatedButton(
          onPressed: action,
          style: context.buttonStyles.buttonApp,
          child: Text(
            title,
            style: context.textStyles.titleLarge.copyWith(
              color: ColorsStyles.primary,
            ),
          ),
        ),
      ),
    );
  }
}
