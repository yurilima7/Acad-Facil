import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Screens/Home_Screen/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionsCard extends StatelessWidget {
  final String title;
  final String path;
  final String subtitle;
  final VoidCallback? function;
  final int index;
  final Disciplines discipline;

  const OptionsCard({
    super.key,
    required this.title,
    required this.path,
    this.subtitle = '', 
    this.function, required this.index, 
    required this.discipline,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final providerHomeController = Provider.of<HomeController>(context);

    return InkWell(
      // onTap: () => NavigatorRoutes().detailsScreen(discipline),
      onTap: () {
        if (index == 4) {
          providerHomeController.logout('Logout realizado com sucesso!');
        }
      },
      
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),

        child: Center(
          child: ListTile(
            leading: Image.asset(path, height: height * 0.1,),
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
