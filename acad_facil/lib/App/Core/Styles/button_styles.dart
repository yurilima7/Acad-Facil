import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyles? _instance;

  ButtonStyles._();

  static ButtonStyles get i {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get circleButton => ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF024873),
    shape: const CircleBorder(),
    padding: const EdgeInsets.all(10),
  );
}

extension ButtonStylesExt on BuildContext {
  ButtonStyles get buttonStyles => ButtonStyles.i;
}