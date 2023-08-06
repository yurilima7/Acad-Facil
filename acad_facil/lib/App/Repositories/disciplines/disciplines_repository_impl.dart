import 'dart:developer';

import 'package:acad_facil/App/Core/Data/constants_firebase.dart';
import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Repositories/disciplines/disciplines_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisciplinesRepositoryImpl implements DisciplinesRepository {
  final CollectionReference<Map<String, dynamic>> _colecDiscipline =
      ConstantsFirebase.disciplinesReference;

  @override
  Future<List<Disciplines>?> loadDisciplines() async {
    List<Disciplines>? disciplines;

    try {
      await _colecDiscipline.orderBy('name').get().then((snapshot) {
        disciplines = snapshot.docs
            .map(
              (item) => Disciplines(
                id: item.id,
                name: item.data()['name'],
                classroom: item.data()['classroom'],
                grades: item.data()['grades'] ?? [],
                period: item.data()['period'],
                avarage: item.data()['avarage'],
              ),
            )
            .toList();
      });
    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());

      throw AppException(message: 'Falha ao buscar as disciplinas!');
    }

    return disciplines;
  }

  @override
  Future<void> deleteDiscipline(String id) async {
    try {
      await _colecDiscipline.doc(id).delete();
    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());
      throw AppException(
          message: 'Falha ao deletar disciplina, tente novamente!');
    }
  }

  @override
  Future<void> addGrades(String id, List grades, double avarage) async {
    try {
      await _colecDiscipline.doc(id).update({
        'grades': grades,
        'avarage': avarage,
      });
    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());
      throw AppException(message: 'Falha ao registrar nota, tente novamente!');
    }
  }
  
  @override
  Future<void> updateDiscipline(Disciplines discipline) async {
    try {
      await _colecDiscipline.doc(discipline.id)
        .update({
          'name': discipline.name,
          'classroom': discipline.classroom,
          'period': discipline.period,
        });
    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());
      throw AppException(message: 'Falha no update da disciplina, tente novamente!');
    }
  }
  
  @override
  Future<void> updateGrade(String id, List grades, double avarage) async {
    try {
      await _colecDiscipline.doc(id).update({
          'grades': grades,
          'avarage': avarage,
        });
    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());
      throw AppException(message: 'Falha no update da nota, tente novamente!');
    }
  }
  
  @override
  Future<void> deleteAllDisciplines() async {
    try {
      await _colecDiscipline.get()
      .then(
        (snapshot) {
          for (var doc in snapshot.docs) {
            doc.reference.delete();
          }
        }
      );

    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());
      throw AppException(message: 'Falha ao deletar todas as disciplinas, tente novamente!');
    }
  }
  
  @override
  Future<void> addDiscipline(Disciplines discipline) async {
    try {
      await _colecDiscipline.doc().set({
        'name': discipline.name,
        'classroom': discipline.classroom,
        'period': discipline.period,
        'avarage': discipline.avarage,
      });

    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());
      throw AppException(message: 'Falha ao adicionar a disciplina, tente novamente!');
    }
  }
}
