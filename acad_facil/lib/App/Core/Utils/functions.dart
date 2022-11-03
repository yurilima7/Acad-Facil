import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
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

    login(model.context);
  }

  void homeScreen(AuthModel model) {
    Messages.showSuccess(model.context, 'Login realizado com sucesso!');

    nextScreen(model.context);
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

  void nextScreen(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.tabs,
      (Route<dynamic> route) => false,
    );
  }

  void login(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.loginScreen,
      (Route<dynamic> route) => false,
    );
  }

  void registerScreen(BuildContext context){
    Navigator.of(context).pushNamed(
      AppRoutes.registerScreen,
    );
  }

  void disciplinesScreen(BuildContext context){
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.disciplines,
      (Route<dynamic> route) => false,
    );
  }

  void addSchedules(Disciplines disciplines, BuildContext context) {
    Navigator.of(context).pop();// fecha modal
    Navigator.of(context).pushNamed(
      AppRoutes.addSchedules,
      arguments: disciplines,
    );
  }

  void addGrades(Disciplines disciplines, BuildContext context) {
    Navigator.of(context).pop();// fecha modal
    Navigator.of(context).pushNamed(
      AppRoutes.addGrades,
      arguments: disciplines,
    );
  }

  void detailsScreen(Disciplines discipline, BuildContext context) {
    Navigator.of(context).pushNamed(
        AppRoutes.details,
        arguments: discipline,
    );
  }

  void disciplinesScreenWithoutRemoving(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.disciplines);
  }

  void addDisciplines(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.addDisciplines);
  }
}
