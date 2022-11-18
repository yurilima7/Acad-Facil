import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class ThemeSettings {
  ThemeSettings._();

  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ColorsStyles.primary,
      secondary: ColorsStyles.secundary,
      tertiary: ColorsStyles.terciary,      
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyles.i.mainTitle,

      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
          color: ColorsStyles.white,
        ),
      ),
        
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsStyles.white,
        ),
      ),
    ),

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsStyles.white,
      selectionHandleColor: ColorsStyles.white,
      selectionColor: ColorsStyles.secundary,
    ),

    scaffoldBackgroundColor: ColorsStyles.primary,
    fontFamily: 'Bebas Neue',
  );
}
