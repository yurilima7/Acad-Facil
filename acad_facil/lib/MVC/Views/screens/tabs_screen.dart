import 'package:acad_facil/MVC/Controllers/usuario_controller.dart';
import 'package:acad_facil/MVC/Views/screens/configuracoes_screen.dart';
import 'package:acad_facil/MVC/Views/screens/home_screen.dart';
import 'package:acad_facil/MVC/Views/screens/horarios_screen.dart';
import 'package:acad_facil/MVC/Views/screens/notas_screen.dart';
import 'package:acad_facil/MVC/Styles/estilos_texto.dart';
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
      {'Titulo': '', 'Tela': const HomeScreen()},
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

    if (_telaSelecionada == 0) {
      _telas[0].update(
        'Titulo',
        (value) => UsuarioController().usuario.nome,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _telas[_telaSelecionada]['Titulo'] as String,
          style: context.estilosTexto.tituloAppBar,
        ),
        elevation: 0,
      ),

      body: _telas[_telaSelecionada]['Tela'] as Widget,

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
              color: _telaSelecionada == 0 ? Theme.of(context).colorScheme.tertiary : Colors.white,
            ),
            label: "Home",
            // backgroundColor: Theme.of(context).colorScheme.primary,
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/horario.svg',
              height: 32,
              color: _telaSelecionada == 1 ? Theme.of(context).colorScheme.tertiary : Colors.white,
            ),
            label: "Horário",
            // backgroundColor: Theme.of(context).colorScheme.primary,
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/notas.svg',
              height: 32,
              color: _telaSelecionada == 2 ? Theme.of(context).colorScheme.tertiary : Colors.white,
            ),
            label: 'Notas',
            // backgroundColor: Theme.of(context).colorScheme.primary,
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/configuracao.svg',
              height: 32,
              color: _telaSelecionada == 3 ? Theme.of(context).colorScheme.tertiary : Colors.white,
            ),
            label: 'Configurações',
            // backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}