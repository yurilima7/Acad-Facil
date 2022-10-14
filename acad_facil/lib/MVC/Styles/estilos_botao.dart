import 'package:flutter/material.dart';

class EstilosBotao {
  static EstilosBotao? _instance;

  EstilosBotao._();

  static EstilosBotao get i {
    _instance ??= EstilosBotao._();
    return _instance!;
  }

  ButtonStyle get circleButton => ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF024873),
    shape: const CircleBorder(),
  );
}

extension EstilosBotaoExt on BuildContext {
  EstilosBotao get estilosBotao => EstilosBotao.i;
}