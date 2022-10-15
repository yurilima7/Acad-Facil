import 'package:acad_facil/MVC/Controllers/disciplines_controller.dart';
import 'package:acad_facil/MVC/Controllers/user_controller.dart';
import 'package:acad_facil/MVC/Views/Screens/settings_screen.dart';
import 'package:acad_facil/MVC/Views/Screens/schedules_screen.dart';
import 'package:acad_facil/MVC/Views/Screens/grades_screen.dart';
import 'package:acad_facil/MVC/Views/Screens/tabs_screen.dart';
import 'package:acad_facil/Utils/app_routes.dart';
import 'package:acad_facil/MVC/Views/Screens/home_screen.dart';
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
          create: (_) => DisciplinesControler(),
        ),

        ChangeNotifierProvider(
          create: (_) => UserController(),
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
          AppRoutes.home:(context) => const HomeScreen(),
          AppRoutes.settings:(context) => const SettingsScreen(),
          AppRoutes.schedules:(context) => const SchedulesScreen(),
          AppRoutes.grades:(context) => const GradesScreen(),
        },
      ),
    );
  }
}