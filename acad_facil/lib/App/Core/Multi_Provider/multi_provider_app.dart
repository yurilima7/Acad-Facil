import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Controllers/user_controller.dart';
import 'package:acad_facil/App/Screens/Auth/auth_controller.dart';
import 'package:acad_facil/App/Screens/Home_Screen/home_controller.dart';
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
      ],
      child: child,
    );
  }
}
