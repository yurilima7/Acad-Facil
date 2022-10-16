import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Controllers/user_controller.dart';
import 'package:acad_facil/App/Core/Theme/theme_setttings.dart';
import 'package:acad_facil/App/Screens/Details%20Screen/details_screen.dart';
import 'package:acad_facil/App/Screens/Disciplines%20Screen/disciplines_screen.dart';
import 'package:acad_facil/App/Screens/Grades%20Screen/grades_screen.dart';
import 'package:acad_facil/App/Screens/Home%20Screen/home_screen.dart';
import 'package:acad_facil/App/Screens/Schedules%20Screen/schedules_screen.dart';
import 'package:acad_facil/App/Screens/Settings%20Screen/settings_screen.dart';
import 'package:acad_facil/App/Screens/tabs_screen.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        theme: ThemeSettings.theme,
        debugShowCheckedModeBanner: false,
        
        routes: { 
          AppRoutes.tabs:(context) => const TabsScreen(),
          AppRoutes.home:(context) => const HomeScreen(),
          AppRoutes.settings:(context) => const SettingsScreen(),
          AppRoutes.schedules:(context) => const SchedulesScreen(),
          AppRoutes.grades:(context) => const GradesScreen(),
          AppRoutes.disciplines:(context) => const DisciplinesScreen(),
          AppRoutes.details:(context) => const DetailsScreen(),
        },
      ),
    );
  }
}