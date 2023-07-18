import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/acad_facil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader {
  static void showLoader() {
    showDialog(
      context: navigatorKey.currentState!.context,
      builder: (_) => SpinKitThreeInOut(
        color: ColorsStyles.white,
      ),
    );
  }

  static void hideLoader() {
    Navigator.of(navigatorKey.currentState!.context).pop();
  }
}
