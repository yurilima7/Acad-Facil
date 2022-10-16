import 'package:acad_facil/App/Models/disciplines.dart';

final dummyDisciplines = [

  Disciplines(
    id: 'm1',
    name: 'Circuítos Elétricos',
    classroom: '01',
    period: 2,
    grades: {
      'n1': 9,
    },
    schedule:{
      'SEG': '07:00 - 08:40',
    },
    avarage: 9,
  ),
  Disciplines(
    id: 'm2',
    name: 'Cálculo II',
    classroom: '02',
    period: 2,
    grades: {
      
    },
    schedule:{
      'TER': '07:00 - 08:40',
      'QUA': '10:35 - 12:15'
    },
    avarage: 0,
  ),
  Disciplines(
    id: 'm3',
    name: 'Estrutura de Dados I',
    classroom: '02',
    period: 2,
    grades: {
      'n1': 9,
      'N2': 6,
    },
    schedule:{
      'QUA': '08:40 - 10:35',
    },
    avarage: 7.5,
  ),
  Disciplines(
    id: 'm4',
    name: 'Inglês Instrumental',
    classroom: '02',
    period: 2,
    grades: {
      'n1': 9,
    },
    schedule:{
      'SEG': '08:40 - 10:35',
    },
    avarage: 9,
  ),
  Disciplines(
    id: 'm5',
    name: 'Matemática Discreta',
    classroom: '02',
    period: 2,
    grades: {
      'n1': 9,
    },
    schedule:{
      'SEX': '08:40 - 10:35',
    },
    avarage: 9,
  ),
  Disciplines(
    id: 'm6',
    name: 'Metodologia Científica',
    classroom: '02',
    period: 2,
    grades: {
      'n1': 9,
      'n2': 9,
      'n3': 8,
    },
    schedule:{
      'QUI': '08:40 - 10:35',
    },
    avarage: 8.67,
  ),
];
