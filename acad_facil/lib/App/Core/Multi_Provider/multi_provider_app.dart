import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Controllers/user_controller.dart';
import 'package:acad_facil/App/Screens/Add_Grades/add_grades_controller.dart';
import 'package:acad_facil/App/Screens/Auth/auth_controller.dart';
import 'package:acad_facil/App/Screens/Details_Screen/details_screen_controller.dart';
import 'package:acad_facil/App/Screens/Disciplines_Screen/disciplines_screen_controller.dart';
import 'package:acad_facil/App/Screens/Edit_Disciplines/edit_disciplines_controller.dart';
import 'package:acad_facil/App/Screens/Edit_Grade/edit_grade_controller.dart';
import 'package:acad_facil/App/Screens/Home_Screen/home_controller.dart';
import 'package:acad_facil/App/Screens/Profile_Screen/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProviderApp extends StatelessWidget {
  final Widget child;

  const MultiProviderApp({super.key, required this.child});

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
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => DisciplinesScreenController(),
        ),
        ChangeNotifierProvider(
          create: (_) => DetailsScreenController(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddGradesController(),
        ),
        ChangeNotifierProvider(
          create: (_) => EditDisciplinesController(),
        ),
        ChangeNotifierProvider(
          create: (_) => EditGradeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileScreenController(),
        ),
      ],
      child: child,
    );
  }
}
