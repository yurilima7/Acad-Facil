
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/acad_facil.dart';
import 'package:flutter/material.dart';

class Messages {
  static void showError(String text) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: ColorsStyles.errors,
        duration: const Duration(seconds: 2),
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: scaffoldMessengerKey.currentContext!.textStyles.mainTitle,
        ),
      ),
    );
  }

  static void showSuccess(String text){
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: ColorsStyles.sucess,
        duration: const Duration(seconds: 2),
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: scaffoldMessengerKey.currentContext!.textStyles.mainTitle,
        ),
      ),
    );
  }
}