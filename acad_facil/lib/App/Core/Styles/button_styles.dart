import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyles? _instance;

  ButtonStyles._();

  static ButtonStyles get i {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get buttonApp => ElevatedButton.styleFrom(
        backgroundColor: ColorsStyles.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
      );
}

extension ButtonStylesExt on BuildContext {
  ButtonStyles get buttonStyles => ButtonStyles.i;
}
