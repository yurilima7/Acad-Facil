import 'dart:developer';

import 'package:acad_facil/App/Controllers/disciplines_provider.dart';
import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Utils/functions.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:acad_facil/App/Models/add_schedule_model.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisciplinesControler with ChangeNotifier implements DisciplinesProvider {
  List<Disciplines> _disciplines = [];

  List<Disciplines> get disciplines => [..._disciplines];

  int get disciplinesCount {
    return _disciplines.length;
  }

  @override
  Future<void> loadDisciplines() async {
    try {
      await Constants.disciplinesReference
          .orderBy('name')
          .get()
          .then((snapshot) {
        _disciplines = snapshot.docs
            .map(
              (item) => Disciplines(
                id: item.id,
                name: item.data()['name'],
                classroom: item.data()['classroom'],
                grades: Map.castFrom<String, dynamic, String, double>(
                    item.data()['grades'] ?? {}),
                period: item.data()['period'],
                schedule: Map.castFrom<String, dynamic, String, String>(
                    item.data()['schedule'] ?? {}),
                avarage: item.data()['avarage'],
              ),
            )
            .toList();
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
  Future<void> addDisciplines(Disciplines discipline) async {
    try {
      var newDisciplineRef = Constants.disciplinesReference.doc();

      await newDisciplineRef.set({
        'name': discipline.name,
        'classroom': discipline.classroom,
        'period': discipline.period,
        'avarage': 0.0,
      });

      _disciplines.add(Disciplines(
        id: newDisciplineRef.id,
        name: discipline.name,
        classroom: discipline.classroom,
        grades: {},
        period: discipline.period,
        schedule: {},
        avarage: 0.0,
      ));

      Messages.showSuccess('Dados inseridos com sucesso!');
      Functions().nextScreen();
    } on FirebaseException catch (e) {
      Messages.showError('Falha ao inserir dados, tente novamente!');
      log(e.toString());
    } on Exception catch (e) {
      Messages.showError('Falha ao inserir dados, tente novamente!');
      log(e.toString());
    }

    notifyListeners();
  }

  @override
  Future<void> deleteDisciplines(Disciplines discipline) async {
    int index = _disciplines.indexWhere((d) => d.id == discipline.id);
    final delDiscipline = _disciplines[index];

    try {
      await Constants.disciplinesReference.doc(discipline.id).delete();

      _disciplines.remove(delDiscipline);
      Messages.showSuccess('Disciplina deletada com sucesso!');
    } on FirebaseException catch (e) {
      Messages.showError('Falha ao deletar disciplina, tente novamente!');
      log(e.toString());
    } on Exception catch (e) {
      Messages.showError('Falha ao deletar disciplina, tente novamente!');
      log(e.toString());
    }
  }

  @override
  Future<void> addGrades(
    String id,
    Map<String, double> grade,
    double avarage,
  ) async {
    if (grade.length < 6) {
      try {
        await Constants.disciplinesReference.doc(id).update({
          'grades': grade,
          'avarage': avarage,
        });

        Messages.showSuccess('Nota adicionada com sucesso!');
        Functions().nextScreen();
      } on FirebaseException catch (e) {
        Messages.showError('Falha ao registrar nota, tente novamente!');
        log(e.toString());
      } on Exception catch (e) {
        Messages.showError('Falha ao registrar nota, tente novamente!');
        log(e.toString());
      }

      notifyListeners();
    } else {
      Messages.showError('Máximo de 5 notas já alcançado!');
    }
  }

  @override
  Future<void> addSchedules(AddScheduleModel model) async {
    try {
      await Constants.disciplinesReference.doc(model.id).update({
        'schedule': model.schedule,
      });

      Messages.showSuccess('Horário adicionado com sucesso!');
      Functions().nextScreen();
    } on FirebaseException catch (e) {
      Messages.showError('Falha ao registrar horário, tente novamente!');
      log(e.toString());
    } on Exception catch (e) {
      Messages.showError('Falha ao registrar horário, tente novamente!');
      log(e.toString());
    }
  }
}
