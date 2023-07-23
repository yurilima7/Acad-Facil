import 'dart:developer';
import 'package:acad_facil/App/Core/Exceptions/app_exception.dart';
import 'package:acad_facil/App/Core/Exceptions/auth_exception.dart';
import 'package:acad_facil/App/Core/Notifier/app_status.dart';
import 'package:acad_facil/App/Core/Utils/assets.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
import 'package:acad_facil/App/Core/Utils/navigator_routes.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:acad_facil/App/repositories/auth/auth_repository_impl.dart';
import 'package:acad_facil/App/repositories/disciplines/disciplines_repository_impl.dart';
import 'package:acad_facil/App/repositories/user/user_repository_impl.dart';

class HomeController extends AppStatus {
  UserModel? _user;
  UserModel? get user => _user;

  List<Disciplines>? _disciplines;
  List<Disciplines>? get disciplines => [...?_disciplines];

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

  void successAction() {
    Messages.showSuccess('Dados inseridos com sucesso!');
    NavigatorRoutes().nextScreen();
  }

  Future<void> loadDataUser() async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      _user = await UserRepositoryImpl().loadUser();
      _disciplines = await DisciplinesRepositoryImpl().loadDisciplines();

      if (_disciplines == null || _user == null) {
        return;
      }
    } on AppException catch (e) {
      setError(e.message);
      log(e.toString());
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> logout(String msg) async {
    try {
      await AuthRepositoryImpl().logoutApp();
      NavigatorRoutes().logoutApp(msg);
    } on AuthException catch (e) {
      setError(e.message);
      log(e.message);
    } finally {
      notifyListeners();
    }
  }
}
