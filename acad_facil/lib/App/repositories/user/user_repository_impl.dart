import 'dart:developer';

import 'package:acad_facil/App/Core/Data/constants_firebase.dart';
import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:acad_facil/App/Repositories/user/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepositoryImpl extends UserRepository {
  final DocumentReference<Map<String, dynamic>> _docUser =
      ConstantsFirebase.userDoc;
  final CollectionReference<Map<String, dynamic>> _colecDiscipline =
      ConstantsFirebase.disciplinesReference;
  final _user = ConstantsFirebase.user;

  /// Adiciona dados de um usuário
  @override
  Future<void> addData(UserModel user) async {
    try {
      await _docUser.set({
        'name': ConstantsFirebase.auth.currentUser!.displayName,
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
      await _user?.delete();
      
      await _colecDiscipline.get().then((snapshot) {
        for (var doc in snapshot.docs) {
          doc.reference.delete();
        }
      });

      await _docUser.delete();
    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());

      throw AppException(message: 'Falha ao encerrar a conta do usuário!');
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
          perfilUrl: _user?.photoURL ?? 'https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE60QogebgAWTalE1myseY1Hbb5qPM.jpg',
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
