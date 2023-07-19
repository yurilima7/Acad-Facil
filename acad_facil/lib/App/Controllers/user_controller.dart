import 'dart:developer';

import 'package:acad_facil/App/Controllers/Auth/auth.dart';
import 'package:acad_facil/App/Controllers/user_provider.dart';
import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Utils/navigator_routes.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserController with ChangeNotifier implements UserProvider {
  UserModel? _user;
  UserModel? get user => _user;

  final perfilOpt =
      'https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE60QogebgAWTalE1myseY1Hbb5qPM.jpg';

  void successAction() {
    Messages.showSuccess('Dados inseridos com sucesso!');
    NavigatorRoutes().nextScreen();
  }

  @override
  Future<void> loadUser() async {
    try {
      await Constants.idUserCollection.get().then((doc) {
        _user = UserModel(
          id: doc.id,
          name: doc.data()!['name'],
          course: doc.data()!['course'],
          period: doc.data()!['period'],
          perfilUrl: Constants.user?.photoURL ?? perfilOpt,
        );
      });
    } on FirebaseException catch (e) {
      Messages.showError('Falha na leitura, tente novamente!');
      log(e.toString());
    } on Exception catch (e) {
      Messages.showError('Falha na leitura, tente novamente!');
      log(e.toString());
    }

    notifyListeners();
  }

  @override
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

  @override
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
}
