import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Controllers/user_controller.dart';
import 'package:acad_facil/App/Core/Widgets/text_button_app.dart';
import 'package:acad_facil/App/Screens/Auth/auth_controller.dart';
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
     DisciplinesControler providerDiscipline
      = Provider.of<DisciplinesControler>(context, listen: false);
    
    void logout() async {
      await AuthController().logout('Logout realizado com sucesso!');
    }

    void delete() async {
      await providerUser.deleteUser();
    }

    void deleteData() async {
      await providerDiscipline.deleteData();
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          TextButtonApp(
            title: 'Deletar todas as disciplinas',
            action: deleteData,
            message: 'Deseja deletar todas as disciplinas?',
            alert: true,
          ),

          TextButtonApp(
            title: 'Encerrar conta',
            action: delete,
            position: 1,
            message: 'Deseja realmente encerrar a conta?',
            alert: true,
          ),

          TextButtonApp(
            title: 'Sair da conta',
            action: logout,
            position: 2,
            message: 'Deseja sair da aplicação?',
            alert: true,
          ),
        ],
      ),
    );
  }
}
