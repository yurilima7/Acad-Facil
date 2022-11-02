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
  TextStyle get mainTitle => primaryRegular.copyWith(
    color: ColorsStyles.white,
    fontSize: 16,
  );

  TextStyle get mainTitleBlue => primaryRegular.copyWith(
    color: ColorsStyles.terciary,
    fontSize: 16,
  );

  TextStyle get authTitle => primaryRegular.copyWith(
    color: ColorsStyles.white,
    fontSize: 25,
  );

  TextStyle get bigTitle => primaryRegular.copyWith(
    color: ColorsStyles.white,
    fontSize: 30,
  );

  TextStyle get grade => primaryRegular.copyWith(
    color: ColorsStyles.terciary,
    fontSize: 30,
  );

  TextStyle get appBarTitle => primaryRegular.copyWith(
    color: ColorsStyles.white,
    fontSize: 20,
  );

  TextStyle get mainCardTitle => primaryRegular.copyWith(
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

  TextStyle get secundaryOptions => secondarySemiBold.copyWith(
    color: ColorsStyles.white,
    fontSize: 15,
  );
}

extension TextStylesExt on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}