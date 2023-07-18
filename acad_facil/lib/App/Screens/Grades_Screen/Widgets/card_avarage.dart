import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/navigator_routes.dart';
import 'package:acad_facil/App/Core/Widgets/sticker_percent.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardAvarage extends StatelessWidget {
  final double avarage;
  final String disciplina;

  const CardAvarage({
    Key? key,
    required this.avarage,
    required this.disciplina,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final discipline = Provider.of<Disciplines>(context, listen: false);

    return InkWell(
      onTap: () => NavigatorRoutes().detailsScreen(discipline),
      child: Card(
        color: ColorsStyles.secundary,
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 5.0,
            right: 5.0,
            bottom: 5.0,
            top: 5.0,
          ),
          child: Center(
            child: ListTile(
              title: Text(disciplina, style: context.textStyles.titleMedium),
              trailing: StickerPercent(
                avarage: avarage,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
