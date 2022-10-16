import 'package:flutter/material.dart';

class ThemeSettings {
  ThemeSettings._();

  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xFF021F59),
      secondary: const Color(0xFF024873),
      tertiary: const Color(0xFF04B2D9),      
    ),
    scaffoldBackgroundColor: const Color(0xFF021F59),
    fontFamily: 'Bebas Neue',
  );
}
