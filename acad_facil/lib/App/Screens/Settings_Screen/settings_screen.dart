import 'package:acad_facil/App/Core/Auth/auth.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    void logout() async {
      await Auth().logout(AuthModel(context: context));
    }

    return Column(
      children: [
        ElevatedButton(
          onPressed: () => logout(),
          child: const Text('Sair'),
        ),
      ],
    );
  }
}
