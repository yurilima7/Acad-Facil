import 'package:acad_facil/App/Controllers/Auth/auth.dart';
import 'package:acad_facil/App/Controllers/user_controller.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
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
      await Auth().logout(AuthModel(context: context));
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          ElevatedButton(
            onPressed: () => logout(),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsStyles.secundary,
              padding: const EdgeInsets.all(10),
            ),
            child: Text(
              'Sair',
              style: context.textStyles.mainTitle,
            ),
          ),

          ElevatedButton(
            onPressed: () async {
              await providerUser.deleteUser(context, mounted);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsStyles.secundary,
              padding: const EdgeInsets.all(10),
            ),
            child: Text(
              'Encerrar conta',
              style: context.textStyles.mainTitle,
            ),
          ),
        ],
      ),
    );
  }
}
