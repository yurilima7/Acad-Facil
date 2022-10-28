import 'dart:developer';

import 'package:acad_facil/App/Controllers/user_provider.dart';
import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Utils/functions.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserController with ChangeNotifier implements UserProvider {
  User _user = User();
  User get user => _user;

  void successAction(BuildContext context) {
    Messages.showSuccess(context, 'Dados inseridos com sucesso!');
    Functions().nextScreen(context);
  }

  @override
  Future<void> editData(User user) {
    throw UnimplementedError();
  }

  @override
  Future<void> loadUser() async {
    try {
      await Constants.idUserCollection.get().then((doc) {
        _user = User(
          id: doc.id,
          name: doc.data()!['name'],
          course: doc.data()!['course'],
          period: doc.data()!['period'],
        );
      });
    } on FirebaseException catch (e) {
      log(e.toString());
    } on Exception catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }

  @override
  Future<void> addData(User user, BuildContext context) async {
    bool success = false;

    try {
      await Constants.idUserCollection.set({
        'name': Constants.auth.currentUser!.displayName,
        'course': user.course,
        'period': user.period,
      });
      success = true;
    } on FirebaseException catch (e) {
      log(e.toString());
    } on Exception catch (e) {
      log(e.toString());
    }

    if (success) {
      successAction(context);
    }
  }

  @override
  Future<void> deleteUser(User user) async {
    throw UnimplementedError();
  }
}
