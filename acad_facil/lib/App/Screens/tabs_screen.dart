import 'package:acad_facil/App/Controllers/user_controller.dart';
import 'package:acad_facil/App/Screens/Settings_Screen/settings_screen.dart';
import 'package:acad_facil/App/Screens/Home_Screen/home_screen.dart';
import 'package:acad_facil/App/Screens/Schedules_Screen/schedules_screen.dart';
import 'package:acad_facil/App/Screens/Grades_Screen/grades_screen.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreen = 0;
  late List <Map <String, Object>> _screen;

  @override
  void initState(){
    super.initState();

    _screen = [
      {'Titulo': '', 'Tela': const HomeScreen()},
      {'Titulo': 'Horário', 'Tela': const SchedulesScreen()},
      {'Titulo': 'Notas', 'Tela': const GradesScreen()},
      {'Titulo': 'Configurações', 'Tela': const SettingsScreen()},
    ];
  }

  _selecionaTela(int index){
    setState(() {
      _selectedScreen = index;
    });
   }

  @override
  Widget build(BuildContext context) {
    final providerUser = Provider.of<UserController>(context).user;

    if (_selectedScreen == 0) {
      _screen[0].update(
        'Titulo',
        (value) => providerUser.name,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screen[_selectedScreen]['Titulo'] as String,
          style: context.textStyles.appBarTitle,
        ),
        elevation: 0,
      ),

      body: _screen[_selectedScreen]['Tela'] as Widget,

      bottomNavigationBar: BottomNavigationBar(
        onTap: _selecionaTela,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              height: 32,
              color: _selectedScreen == 0 ? Theme.of(context).colorScheme.tertiary : Colors.white,
            ),
            label: "Home",
            // backgroundColor: Theme.of(context).colorScheme.primary,
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/horario.svg',
              height: 32,
              color: _selectedScreen == 1 ? Theme.of(context).colorScheme.tertiary : Colors.white,
            ),
            label: "Horário",
            // backgroundColor: Theme.of(context).colorScheme.primary,
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/notas.svg',
              height: 32,
              color: _selectedScreen == 2 ? Theme.of(context).colorScheme.tertiary : Colors.white,
            ),
            label: 'Notas',
            // backgroundColor: Theme.of(context).colorScheme.primary,
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/configuracao.svg',
              height: 32,
              color: _selectedScreen == 3 ? Theme.of(context).colorScheme.tertiary : Colors.white,
            ),
            label: 'Configurações',
            // backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}