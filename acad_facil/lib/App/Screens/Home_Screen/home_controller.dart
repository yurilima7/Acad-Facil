import 'dart:developer';

import 'package:acad_facil/App/Controllers/Auth/auth.dart';
import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Core/Exceptions/auth_exception.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:acad_facil/App/Core/Utils/navigator_routes.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:acad_facil/App/repositories/auth/auth_repository_impl.dart';
import 'package:acad_facil/App/repositories/disciplines/disciplines_repository_impl.dart';
import 'package:acad_facil/App/repositories/user/user_repository_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;
  List<Disciplines>? _disciplines;

  List<Disciplines>? get disciplines => [...?_disciplines];

  final perfilOpt =
      'https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE60QogebgAWTalE1myseY1Hbb5qPM.jpg';

  void successAction() {
    Messages.showSuccess('Dados inseridos com sucesso!');
    NavigatorRoutes().nextScreen();
  }

  Future<void> loadUser() async {
    try {
      _user = await UserRepositoryImpl().loadUser();

      if (_user == null) {
        return;
      }
    } on AppException catch (e) {
      Messages.showError('Falha na leitura, tente novamente!');
      log(e.toString());
    }

    notifyListeners();
  }

  Future<void> loadDisciplines() async {
    try {
      _disciplines = await DisciplinesRepositoryImpl().loadDisciplines();
      if (_disciplines == null) {
        return;
      }
    } on AppException catch (e) {
      Messages.showError('Falha na leitura, tente novamente!');
      log(e.toString());
    }

    notifyListeners();
  }

  Future<void> addData(UserModel user) async {
    try {
      await Constants.idUserCollection.set({
        'name': Constants.auth.currentUser!.displayName,
        'course': user.course,
        'period': user.period,
      });

      successAction();
    } on FirebaseException catch (e) {
      Messages.showError('Falha ao inserir dados, tente novamente!');
      log(e.toString());
    } on Exception catch (e) {
      Messages.showError('Falha ao inserir dados, tente novamente!');
      log(e.toString());
    }
  }

  Future<void> deleteUser() async {
    try {
      await Constants.disciplinesReference.get().then((snapshot) {
        for (var doc in snapshot.docs) {
          doc.reference.delete();
        }
      });

      await Constants.userRefence.doc(Constants.userId).delete();
      await Constants.user?.delete();
      Auth().logout('Conta deletada com sucesso!');
    } on FirebaseException catch (e) {
      Messages.showError('Falha ao deletar conta, tente novamente!');
      log(e.toString());
    } on Exception catch (e) {
      Messages.showError('Falha ao deletar conta, tente novamente!');
      log(e.toString());
    }
  }

  Future<void> logout(String msg) async {
    try {
      await AuthRepositoryImpl().logoutApp();
      NavigatorRoutes().logoutApp(msg);
    } on AuthException catch (e) {
      // setError(e.message);
      log(e.message);
    } finally {
      notifyListeners();
    }
  }
}
