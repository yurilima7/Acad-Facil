import 'dart:developer';

import 'package:acad_facil/App/Controllers/disciplines_provider.dart';
import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Data/dummy_disciplines.dart';
import 'package:acad_facil/App/Core/Utils/functions.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
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
      await Constants.db.collection('Users').doc(Constants.userId)
      .collection('Disciplines').orderBy('name').get().then(
          (snapshot) {
            _disciplines = snapshot.docs.map(
            (item) => Disciplines(
                id: item.id,
                name: item.data()['name'],
                classroom: item.data()['classroom'],
                grades: Map.castFrom<String, dynamic, String, double>(
                    item.data()['grades'] ?? {}),
                period: item.data()['period'],
                schedule: item.data()['schedule'] ?? {},
                avarage: item.data()['avarage'],
              ),
          ).toList();
        }
        
      );
    } on FirebaseException catch (e) {
      log(e.toString());
    } on Exception catch (e) {
      log(e.toString());
    }
    
    notifyListeners();
  }

  @override
  Future<void> addDisciplines(
    Disciplines discipline,
    bool mounted,
    BuildContext context,
  ) async {

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

      if (!mounted) return;
      Messages.showSuccess(context, 'Dados inseridos com sucesso!');
      Functions().nextScreen(context);
      
    } on FirebaseException catch (e) {
      log(e.toString());
    } on Exception catch (e) {
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
    } on FirebaseException catch (e) {
      log(e.toString());
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> editDisciplines(Disciplines discipline) async {
    int index = _disciplines.indexWhere((d) => d.id == discipline.id);

    try {
      await Constants.disciplinesReference.doc().update({
        'name': discipline.name,
        'classroom': discipline.classroom,
        'grades': discipline.grades,
        'period': discipline.period,
        'schedule': discipline.schedule,
        'avarage': discipline.avarage,
      });

      _disciplines[index] = discipline;
    } on FirebaseException catch (e) {
      log(e.toString());
    } on Exception catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }

  @override
  Future<void> addGrades(
    String id,
    Map<String, double> grade,
    double avarage,
    bool mounted,
    BuildContext context,
  ) 
  async {
    if(grade.length < 6){
      try {
        await Constants.disciplinesReference.doc(id).update({
          'grades': grade,
          'avarage': avarage,
        });

        if(!mounted) return;
        Messages.showSuccess(context, 'Nota adicionada com sucesso!');
        Functions().nextScreen(context);

      } on FirebaseException catch (e) {
        log(e.toString());
      } on Exception catch (e) {
        log(e.toString());
      }

      notifyListeners();
    } else{
      Messages.showError(
        context,
        'Máximo de 5 notas já alcançado!',
      );
    }
  }

  @override
  List disciplinesDay(String day) {

    List disciplinesOfDay = dummyDisciplines.map(
      (e) {
          if(e.schedule[day] != null){
            return e.schedule[day];
          }
      },
    ).toList();
    
    disciplinesOfDay.removeWhere((element) => element == null);
   
    return disciplinesOfDay;
  }
  
  @override
  List disciplineSchedule(String day) {

    List disciplinesOfDay = dummyDisciplines.map(
      (e) {
          if(e.schedule[day] != null){
            return e.name;
          }
      },
    ).toList();
    
    disciplinesOfDay.removeWhere((element) => element == null);
   
    return disciplinesOfDay;
  }
  
}
