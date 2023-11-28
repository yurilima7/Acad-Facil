import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Widgets/app_bar_main.dart';
import 'package:acad_facil/App/Core/Widgets/tab_nav.dart';
import 'package:acad_facil/App/Core/Widgets/text_button_app.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:acad_facil/App/Screens/Profile_Settings_Screen/profile_settings_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
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
      = Provider.of<ProfileSettingsScreenController>(context);
    final nav = Navigator.of(context);

    return Scaffold(
      appBar: AppBarMain(
        titleStr: 'Configurações de Perfil',
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
    
            TextButtonApp(
              title: 'Sair da conta',
              function: () async {
                await settingsScreenController.logout();

                if (settingsScreenController.isSuccess) {
                  nav.pushNamedAndRemoveUntil(
                    AppRoutes.loginScreen,
                    (route) => false,
                  );
                }
              },
              message: 'Deseja realmente sair do Acad Fácil?',
              position: 2,
              alert: true,
            ),
          ],
        ),
      ),

      bottomNavigationBar: const TabNav(currentScreen: 2),
    );
  }
}
