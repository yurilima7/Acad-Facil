import 'package:acad_facil/MVC/Models/materia_funcoes.dart';
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
    return ChangeNotifierProvider(
      create: (_) => MateriaFuncoes(),
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
          AppRoutes.materias:(context) => const HomeScreen(),
        },
      ),
    );
  }
}