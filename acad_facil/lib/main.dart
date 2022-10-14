import 'package:acad_facil/MVC/Controllers/disciplinas_controller.dart';
import 'package:acad_facil/MVC/Controllers/usuario_controller.dart';
import 'package:acad_facil/MVC/Views/screens/configuracoes_screen.dart';
import 'package:acad_facil/MVC/Views/screens/horarios_screen.dart';
import 'package:acad_facil/MVC/Views/screens/notas_screen.dart';
import 'package:acad_facil/MVC/Views/screens/tabs_screen.dart';
import 'package:acad_facil/Utils/app_routes.dart';
import 'package:acad_facil/MVC/Views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AcadFacil());
}

class AcadFacil extends StatelessWidget {
  const AcadFacil({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DisciplinasControler(),
        ),

        ChangeNotifierProvider(
          create: (_) => UsuarioController(),
        ),
      ],
      
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF021F59),
            secondary: const Color(0xFF024873),
            tertiary: const Color(0xFF04B2D9),      
          ),
          scaffoldBackgroundColor: const Color(0xFF021F59),
          fontFamily: 'Bebas Neue',
        ),
        debugShowCheckedModeBanner: false,
        
        routes: { 
          AppRoutes.tabs:(context) => const TabsScreen(),
          AppRoutes.materias:(context) => const HomeScreen(),
          AppRoutes.configuracoes:(context) => const ConfiguracoesScreen(),
          AppRoutes.horarios:(context) => const HorariosScreen(),
          AppRoutes.notas:(context) => const NotasScreen(),
        },
      ),
    );
  }
}