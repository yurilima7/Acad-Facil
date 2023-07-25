import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class Messages {
  late final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey;

  Messages._();

  static Messages? _instance;

  static Messages get i {
    _instance ??= Messages._();
    return _instance!;
  }

  set scaffoldMessagerKey(GlobalKey<ScaffoldMessengerState> key) =>
      _scaffoldMessengerKey = key;

  void showError(String text) {
    _scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: ColorsStyles.errors,
        duration: const Duration(seconds: 2),
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyles.i.titleMedium,
        ),
      ),
    );
  }

  void showInfo(String text) {
    _scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: ColorsStyles.info,
        duration: const Duration(seconds: 2),
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyles.i.titleMedium
              .copyWith(color: ColorsStyles.primary),
        ),
      ),
    );
  }

  void showSuccess(String text) {
    _scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: ColorsStyles.sucess,
        duration: const Duration(seconds: 2),
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyles.i.titleMedium,
        ),
      ),
    );
  }
}
