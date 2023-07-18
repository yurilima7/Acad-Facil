import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Models/edit_grade_model.dart';
import 'package:acad_facil/App/acad_facil.dart';
import 'package:flutter/material.dart';

class NavigatorRoutes {
  void verify() async {
    await Constants.userRefence.doc(Constants.userId).get().then((doc) {
      if (doc.exists) {
        homeScreen();
      } else {
        registerDataScreen();
      }
    });
  }

  void loginScreen() {
    // Messages.showSuccess('Registro realizado com sucesso!');

    login();
  }

  void homeScreen() {
    Messages.showSuccess('Login realizado com sucesso!');

    nextScreen();
  }

  void registerDataScreen() {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AppRoutes.registerDataScreen,
      (Route<dynamic> route) => false,
    );
  }

  void logoutApp(String msg) {
    Messages.showSuccess(msg);

    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AppRoutes.loginScreen,
      (Route<dynamic> route) => false,
    );
  }

  void nextScreen() {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AppRoutes.tabs,
      (Route<dynamic> route) => false,
    );
  }

  void login() {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AppRoutes.loginScreen,
      (Route<dynamic> route) => false,
    );
  }

  void registerScreen() {
    navigatorKey.currentState!.pushNamed(
      AppRoutes.registerScreen,
    );
  }

  void disciplinesScreen() {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      AppRoutes.disciplines,
      (Route<dynamic> route) => false,
    );
  }

  void addGrades(Disciplines disciplines) {
    navigatorKey.currentState!.pop(); // fecha modal
    navigatorKey.currentState!.pushNamed(
      AppRoutes.addGrades,
      arguments: disciplines,
    );
  }

  void detailsScreen(Disciplines discipline) {
    navigatorKey.currentState!.pushNamed(
      AppRoutes.details,
      arguments: discipline,
    );
  }

  void disciplinesScreenWithoutRemoving() {
    navigatorKey.currentState!.pushNamed(AppRoutes.disciplines);
  }

  void addDisciplines() {
    navigatorKey.currentState!.pushNamed(AppRoutes.addDisciplines);
  }

  void editGrade(EditGradeModel model) {
    navigatorKey.currentState!.pushNamed(
      AppRoutes.editGrade,
      arguments: model,
    );
  }

  void editDiscipline(Disciplines discipline) {
    navigatorKey.currentState!.pushNamed(
      AppRoutes.editDisciplines,
      arguments: discipline,
    );
  }
}
