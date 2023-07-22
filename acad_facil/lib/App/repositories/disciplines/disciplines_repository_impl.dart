
import 'dart:developer';

import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/repositories/disciplines/disciplines_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisciplinesRepositoryImpl implements DisciplinesRepository{
  final CollectionReference<Map<String, dynamic>> colecDiscipline =
      Constants.disciplinesReference;
      
  @override
  Future<List<Disciplines>?> loadDisciplines() async {
    List<Disciplines>? disciplines;

    try {
      await colecDiscipline
          .orderBy('name')
          .get()
          .then((snapshot) {
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
      await colecDiscipline.doc(id).delete();
    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());
      throw AppException(message: 'Falha ao deletar disciplina, tente novamente!');
    }
  }
  
}