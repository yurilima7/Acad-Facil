import 'package:flutter/material.dart';

class EstilosTexto {
  static EstilosTexto? _instance;

  EstilosTexto._();

  static EstilosTexto get i {
    _instance ??= EstilosTexto._();
    return _instance!;
  }

  String get primaryFont => 'Bebas Neue';
  String get secondaryFont => 'Inter';

  // primária
  TextStyle get primarioRegular => TextStyle(
    fontFamily: primaryFont,
    fontWeight: FontWeight.w400,
  );

  // secundária
  TextStyle get secundarioRegular => TextStyle(
    fontFamily: secondaryFont,
    fontWeight: FontWeight.w400,
  );

  TextStyle get secundarioSemiBold => TextStyle(
    fontFamily: secondaryFont,
    fontWeight: FontWeight.w600,
  );

  // personalizado
  TextStyle get tituloPrincipal => primarioRegular.copyWith(
    color: Colors.white,
    fontSize: 16,
  );

  TextStyle get tituloDestacado => primarioRegular.copyWith(
    color: Colors.white,
    fontSize: 30,
  );

  TextStyle get nota => primarioRegular.copyWith(
    color: const Color(0xFF04B2D9),
    fontSize: 30,
  );

  TextStyle get tituloAppBar => primarioRegular.copyWith(
    color: Colors.white,
    fontSize: 20,
  );

  TextStyle get tituloPrincipalCard => primarioRegular.copyWith(
    color: Colors.white,
    fontSize: 12,
  );

  TextStyle get tituloSecundario => secundarioRegular.copyWith(
    color: Colors.white,
    fontSize: 16,
  );

  TextStyle get subTituloSecundario => secundarioRegular.copyWith(
    color: Colors.white,
    fontSize: 10,
  );

  TextStyle get opcoesSecundario => secundarioSemiBold.copyWith(
    color: Colors.white,
    fontSize: 15,
  );
}

extension EstilosTextoExt on BuildContext {
  EstilosTexto get estilosTexto => EstilosTexto.i;
}