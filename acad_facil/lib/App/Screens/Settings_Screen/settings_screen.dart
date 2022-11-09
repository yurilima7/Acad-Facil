import 'package:acad_facil/App/Controllers/Auth/auth.dart';
import 'package:acad_facil/App/Controllers/user_controller.dart';
import 'package:acad_facil/App/Core/Widgets/text_button_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
     UserController providerUser = Provider.of<UserController>(context, listen: false);
    
    void logout() async {
      await Auth().logout('Logout realizado com sucesso!');
    }

    void delete() async {
      await providerUser.deleteUser();
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          TextButtonApp(title: 'Encerrar conta', action: delete),

          TextButtonApp(title: 'Sair da conta', action: logout),
        ],
      ),
    );
  }
}
