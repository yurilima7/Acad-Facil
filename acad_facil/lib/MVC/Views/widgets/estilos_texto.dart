import 'package:flutter/material.dart';

class EstilosTexto {

  static textoTitulo(String titulo) {
    return Text(
      titulo,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }

  static textNormalInter(String titulo) {
    return Text(
      titulo,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Inter',
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
    );
  }

  static textNormalBebas(String titulo) {
    return Text(
      titulo,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }
}
