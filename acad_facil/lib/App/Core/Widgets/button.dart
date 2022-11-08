import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function() action;
  const Button({Key? key, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => action(),
      style: context.buttonStyles.circleButton,
      child: const Icon(Icons.arrow_forward),
    );
  }
}
