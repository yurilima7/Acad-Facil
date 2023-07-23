import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Widgets/text_button_app.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:acad_facil/App/Screens/Settings_Screen/settings_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      user = ModalRoute.of(context)!.settings.arguments as UserModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    final settingsScreenController 
      = Provider.of<SettingsScreenController>(context);
    final nav = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações', style: context.textStyles.titleLarge,),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
    
          children: [
            TextButtonApp(
              title: 'Deletar todas as disciplinas',
              function: () async {
                await settingsScreenController.removeAllDisciplines();
                
                if (settingsScreenController.isSuccess) {
                  nav.pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
                }
              },
              message: 'Deseja deletar todas as disciplinas?',
              alert: true,
            ),
    
            TextButtonApp(
              title: 'Encerrar conta',
              function: () async {
                await settingsScreenController.deleteUser();

                if (settingsScreenController.isSuccess) {
                  nav.pushNamedAndRemoveUntil(AppRoutes.loginScreen, (route) => false);
                }
              },
              position: 1,
              message: 'Deseja realmente encerrar a conta?',
              alert: true,
            ),
    
            TextButtonApp(
              title: 'Alterar informações de perfil',
              function: () => nav.pushNamed(AppRoutes.profileSettings, arguments: user),
              position: 2,
            ),
          ],
        ),
      ),
    );
  }
}
