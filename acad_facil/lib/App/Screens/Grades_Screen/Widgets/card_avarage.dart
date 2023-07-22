import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Widgets/sticker_percent.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';

class CardAvarage extends StatelessWidget {
  final double avarage;
  final String disciplina;
  final List<Disciplines> disciplines;
  final Disciplines discipline;
  final int period;

  const CardAvarage({
    super.key,
    required this.avarage,
    required this.disciplina,
    required this.disciplines,
    required this.discipline,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.details,
          arguments: {
            "discipline": discipline,
            "listDisciplines": disciplines,
            "period": period,
          },
        );
      },

      child: Card(
        color: ColorsStyles.secundary,
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(26.0)),
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
