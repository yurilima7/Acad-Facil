import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:acad_facil/App/Screens/Home_Screen/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionsCard extends StatelessWidget {
  final String title;
  final String path;
  final String subtitle;
  final VoidCallback? function;
  final int index;
  final List<Disciplines>? discipline;
  final UserModel? user;

  const OptionsCard({
    super.key,
    required this.title,
    required this.path,
    this.subtitle = '',
    this.function,
    required this.index,
    this.discipline,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final nav = Navigator.of(context);
    final providerHomeController = Provider.of<HomeController>(context);

    Future<void> logout() async {
      await providerHomeController.logout();
      if (providerHomeController.isSuccess) {
        nav.pushNamedAndRemoveUntil(AppRoutes.loginScreen, (route) => false);
      }
    }

    return InkWell(
      onTap: () {
        if (index == 0) {
          nav.pushNamed(
            AppRoutes.grades,
            arguments: {
              "disciplines": discipline ?? [],
              "period": user?.period ?? 0,
            },
          );
        } else if (index == 1) {
          nav.pushNamed(
            AppRoutes.disciplines,
            arguments: {
              "disciplines": discipline ?? [],
              "period": user?.period ?? 0,
            },
          );
        } else if (index == 2) {
          nav.pushNamed(AppRoutes.settings, arguments: user);
        } else if (index == 3) {
          logout();
        }
      },
      
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Center(
          child: ListTile(
            leading: Image.asset(
              path,
              height: height * 0.1,
            ),
            title: Text(
              title,
              style: context.textStyles.titleMedium,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              subtitle,
              style: context.textStyles.secundarySubTitle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
