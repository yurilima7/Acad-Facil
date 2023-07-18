import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback? action;

  const Button({
    Key? key,
    required this.action,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
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
    );
  }
}
