import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader {
  late final GlobalKey<NavigatorState> _navigatorKey;

  Loader._();

  static Loader? _instance;

  static Loader get i {
    _instance ??= Loader._();
    return _instance!;
  }

  set navigatorKey(GlobalKey<NavigatorState> key) => _navigatorKey = key;

  void showLoader() {
    showDialog(
      context: _navigatorKey.currentState!.context,
      builder: (_) => SpinKitThreeInOut(
        color: ColorsStyles.white,
      ),
    );
  }

  void hideLoader() {
    Navigator.of(_navigatorKey.currentState!.context).pop();
  }
}
