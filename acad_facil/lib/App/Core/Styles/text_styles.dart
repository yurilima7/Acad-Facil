import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get primaryFont => 'Bebas Neue';
  String get secondaryFont => 'Inter';

  // primária
  TextStyle get primaryRegular => TextStyle(
        fontFamily: primaryFont,
        fontWeight: FontWeight.w400,
      );

  // secundária
  TextStyle get secondaryRegular => TextStyle(
        fontFamily: secondaryFont,
        fontWeight: FontWeight.w400,
      );

  TextStyle get secondarySemiBold => TextStyle(
        fontFamily: secondaryFont,
        fontWeight: FontWeight.w600,
      );

  // personalizado
  TextStyle get titleMedium => primaryRegular.copyWith(
        color: ColorsStyles.white,
        fontSize: 16,
      );

  TextStyle get mainTitleBlue => primaryRegular.copyWith(
        color: ColorsStyles.terciary,
        fontSize: 16,
      );

  TextStyle get titleLarge => primaryRegular.copyWith(
        color: ColorsStyles.white,
        fontSize: 22,
      );

  TextStyle get bigTitle => primaryRegular.copyWith(
        color: ColorsStyles.white,
        fontSize: 32,
      );

  TextStyle get cardTitle => primaryRegular.copyWith(
        color: ColorsStyles.terciary,
        fontSize: 26,
      );

  TextStyle get titleSmall => primaryRegular.copyWith(
        color: ColorsStyles.white,
        fontSize: 12,
      );

  TextStyle get chartTitle => primaryRegular.copyWith(
        color: ColorsStyles.terciary,
        fontSize: 20,
      );

  TextStyle get secundaryTitle => secondaryRegular.copyWith(
        color: ColorsStyles.white,
        fontSize: 16,
      );

  TextStyle get secundarySubTitle => secondaryRegular.copyWith(
        color: ColorsStyles.white,
        fontSize: 10,
      );
}

extension TextStylesExt on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
