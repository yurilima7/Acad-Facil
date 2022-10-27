import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:flutter/material.dart';

class Functions {
  void verify(AuthModel model) async {
    await Constants.userRefence.doc(Constants.userId).get().then((doc) {
      if (doc.exists) {
        homeScreen(model);
      } else {
        registerDataScreen(model);
      }
    });
  }

  void loginScreen(AuthModel model) {
    Messages.showSuccess(model.context, 'Registro realizado com sucesso!');

    Navigator.of(model.context).pushNamedAndRemoveUntil(
      AppRoutes.loginScreen,
      (Route<dynamic> route) => false,
    );
  }

  void homeScreen(AuthModel model) {
    Messages.showSuccess(model.context, 'Login realizado com sucesso!');

    Navigator.of(model.context).pushNamedAndRemoveUntil(
      AppRoutes.tabs,
      (Route<dynamic> route) => false,
    );
  }

  void registerDataScreen(AuthModel model) {
    Navigator.of(model.context).pushNamedAndRemoveUntil(
      AppRoutes.registerDataScreen,
      (Route<dynamic> route) => false,
    );
  }

  void logoutApp(AuthModel model) {
    Messages.showSuccess(model.context, 'Logout realizado com sucesso!');

    Navigator.of(model.context).pushNamedAndRemoveUntil(
      AppRoutes.loginScreen,
      (Route<dynamic> route) => false,
    );
  }
}
