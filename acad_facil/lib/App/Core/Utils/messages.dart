
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class Messages {
  static void showError(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorsStyles.errors,
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: context.textStyles.mainTitle,
        ),
      ),
    );
  }
}