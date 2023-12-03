import 'dart:developer';
import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Core/Notifier/app_status.dart';
import 'package:acad_facil/App/Core/Utils/assets.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:acad_facil/App/Repositories/disciplines/disciplines_repository_impl.dart';
import 'package:acad_facil/App/Repositories/user/user_repository_impl.dart';

class HomeController extends AppStatus {
  UserModel? _user;
  UserModel? get user => _user;

  List<Disciplines>? _disciplines;
  List<Disciplines>? get disciplines => [...?_disciplines];
  List<Disciplines> filtered = [];
  List<Disciplines> _disciplinesfilteredSearch = [];

  final List<int> _periods = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int _periodNow = 0;
  int periodSelected = 0;

  int get period => _periodNow;

  final List<String> assets = [
    Assets.notas,
    Assets.university,
    Assets.user,
    Assets.exit,
  ];

  final List<String> titles = [
    'Suas Notas',
    'Disciplinas',
    'Perfil',
    'Sair',
  ];

  List<int> get periodsWithoutZero =>
      _periods.where((period) => period != 0 && period <= _periodNow).toList();

  /// ATUALIZA O PERÍODO DO ESTUDANTE PARA EXIBIR AS DISCIPLINAS DELE NO MESMO
  void updatePeriod(int update) {
    if (update == 0) {
      filtered = _disciplines!;
      _disciplinesfilteredSearch = _disciplines!;
      periodSelected = 0;
    } else {
      filtered = _disciplines!.where((d) => d.period == update).toList();
      _disciplinesfilteredSearch = _disciplines!.where((d) => d.period == update).toList();
      periodSelected = update;
    }

    notifyListeners();
  }

  /// FUNÇÃO DE FILTRO DA SEARCH
  void filter(String value) {
    filtered = _disciplinesfilteredSearch
        .where((d) => d.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  Future<void> loadDataUser() async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      _user = await UserRepositoryImpl().loadUser();
      _disciplines = await DisciplinesRepositoryImpl().loadDisciplines();

      if (_disciplines == null || _user == null) {
        setError('Erro ao buscar os dados do usuário!');
      } else {
        filtered =
            _disciplines!.where((d) => d.period == user!.period).toList();

        _disciplinesfilteredSearch =
            _disciplines!.where((d) => d.period == user!.period).toList();
            
        _periodNow = user!.period;
        periodSelected = user!.period;
        notifyListeners();
      }
    } on AppException catch (e) {
      setError(e.message);
      log(e.toString());
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
