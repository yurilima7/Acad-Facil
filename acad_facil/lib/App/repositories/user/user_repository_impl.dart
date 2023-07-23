import 'dart:developer';

import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:acad_facil/App/repositories/user/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepositoryImpl extends UserRepository {
  final DocumentReference<Map<String, dynamic>> _docUser =
      Constants.idUserCollection;
  final CollectionReference<Map<String, dynamic>> _colecDiscipline =
      Constants.disciplinesReference;
  final _user = Constants.user;

  @override
  Future<void> addData(UserModel user) async {
    try {
      await _docUser.set({
        'name': Constants.auth.currentUser!.displayName,
        'course': user.course,
        'period': user.period,
      });

    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());

      throw AppException(message: 'Falha ao inserir os dados do usuário!');
    }
  }

  @override
  Future<void> deleteUser() async {
    try {
      await _colecDiscipline.get().then((snapshot) {
        for (var doc in snapshot.docs) {
          doc.reference.delete();
        }
      });

      await _docUser.delete();
      await _user?.delete();
    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());

      throw AppException(message: 'Falha ao deletar os dados do usuário!');
    }
  }

  @override
  Future<UserModel?> loadUser() async {
    UserModel? userModel;
    try {
      await _docUser.get().then((doc) {
        userModel = UserModel(
          id: doc.id,
          name: doc.data()!['name'],
          course: doc.data()!['course'],
          period: doc.data()!['period'],
          perfilUrl: Constants.user?.photoURL ?? 'https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE60QogebgAWTalE1myseY1Hbb5qPM.jpg',
        );
      });
    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());

      throw AppException(message: 'Falha ao buscar os dados do usuário!');
    }
    
    return userModel;
  }
  
  @override
  Future<void> updateUser(UserModel user) async {
    try {
      await _docUser
        .update({
          'name': user.name,
          'course': user.course,
          'period': user.period,
        });
    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());
      
      throw AppException(message: 'Falha no update de usuário, tente novamente!');
    }
  }
}
