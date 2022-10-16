import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:flutter/material.dart';

class ThemeSettings {
  ThemeSettings._();

  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ColorsStyles.primary,
      secondary: ColorsStyles.secundary,
      tertiary: ColorsStyles.terciary,      
    ),
    scaffoldBackgroundColor: const Color(0xFF021F59),
    fontFamily: 'Bebas Neue',
  );
}
