import 'package:acad_facil/App/Core/Multi_Provider/multi_provider_app.dart';
import 'package:acad_facil/App/Core/Theme/theme_setttings.dart';
import 'package:acad_facil/App/Screens/Add_Disciplines/add_disciplines.dart';
import 'package:acad_facil/App/Screens/Add_Grades/add_grades.dart';
import 'package:acad_facil/App/Screens/Details_Screen/details_screen.dart';
import 'package:acad_facil/App/Screens/Disciplines_Screen/disciplines_screen.dart';
import 'package:acad_facil/App/Screens/Edit_Disciplines/edit_disciplines.dart';
import 'package:acad_facil/App/Screens/Edit_Grade/edit_grade.dart';
import 'package:acad_facil/App/Screens/Grades_Screen/grades_screen.dart';
import 'package:acad_facil/App/Screens/Home_Screen/home_screen.dart';
import 'package:acad_facil/App/Screens/Auth/Login_Screen/login.dart';
import 'package:acad_facil/App/Screens/Register_Data_Screen/register_data.dart';
import 'package:acad_facil/App/Screens/Auth/Register_Screen/register.dart';
import 'package:acad_facil/App/Screens/Settings_Screen/settings_screen.dart';
import 'package:acad_facil/App/Screens/User_State_Screen/user_state_screen.dart';
import 'package:acad_facil/App/Screens/tabs_screen.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class AcadFacil extends StatelessWidget {
  const AcadFacil({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProviderApp(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        theme: ThemeSettings.theme,
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.userStateScreen: (context) => const UserStateScreen(),
          AppRoutes.loginScreen: (context) => const Login(),
          AppRoutes.tabs: (context) => const TabsScreen(),
          AppRoutes.home: (context) => const HomeScreen(),
          AppRoutes.settings: (context) => const SettingsScreen(),
          AppRoutes.grades: (context) => const GradesScreen(),
          AppRoutes.disciplines: (context) => const DisciplinesScreen(),
          AppRoutes.details: (context) => const DetailsScreen(),
          AppRoutes.registerScreen: (context) => const Register(),
          AppRoutes.registerDataScreen: (context) => const RegisterData(),
          AppRoutes.addDisciplines: (context) => const AddDisciplines(),
          AppRoutes.addGrades: (context) => const AddGrades(),
          AppRoutes.editGrade: (context) => const EditGrade(),
          AppRoutes.editDisciplines: (context) => const EditDisciplines(),
        },
      ),
    );
  }
}
