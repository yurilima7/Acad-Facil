import 'package:acad_facil/MVC/Views/screens/configuracoes_screen.dart';
import 'package:acad_facil/MVC/Views/screens/home_screen.dart';
import 'package:acad_facil/MVC/Views/screens/horarios_screen.dart';
import 'package:acad_facil/MVC/Views/screens/notas_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _telaSelecionada = 0;
  late List <Map <String, Object>> _telas;

  @override
  void initState(){
    super.initState();

    _telas = [
      {'Titulo': 'Laura', 'Tela': const HomeScreen()},
      {'Titulo': 'Horário', 'Tela': const HorariosScreen()},
      {'Titulo': 'Notas', 'Tela': const NotasScreen()},
      {'Titulo': 'Configurações', 'Tela': const ConfiguracoesScreen()},
    ];
  }

  _selecionaTela(int index){
    setState(() {
      _telaSelecionada = index;
    });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_telas[_telaSelecionada]['Titulo'] as String),),

      body: _telas[_telaSelecionada]['Tela'] as Widget,

      bottomNavigationBar: BottomNavigationBar(
        onTap: _selecionaTela,
        unselectedItemColor: Colors.white, // quando não selecionado
        selectedItemColor: Theme.of(context).colorScheme.tertiary, // selecionado
        currentIndex: _telaSelecionada, // selecionado atualmente
        elevation: 5,

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              height: MediaQuery.of(context).size.height * 0.034,
              //allowDrawingOutsideViewBox: true,
            ),
            label: "Home",
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/horario.svg',
              height: MediaQuery.of(context).size.height * 0.034,
              //allowDrawingOutsideViewBox: true,
            ),
            label: "Horário",
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/notas.svg',
              height: MediaQuery.of(context).size.height * 0.034,
              //allowDrawingOutsideViewBox: true,
            ),
            label: 'Notas',
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/configuracao.svg',
              height: MediaQuery.of(context).size.height * 0.034,
              //allowDrawingOutsideViewBox: true,
            ),
            label: 'Configurações',
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}