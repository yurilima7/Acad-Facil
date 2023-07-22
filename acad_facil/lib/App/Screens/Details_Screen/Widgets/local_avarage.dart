import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/sticker_percent.dart';
import 'package:flutter/material.dart';

class LocalAvarage extends StatelessWidget {
  final double avarage;
  const LocalAvarage({super.key, required this.avarage});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsStyles.secundary,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26.0)),

      child: Padding(
        padding: const EdgeInsets.only(
          left: 5.0,
          right: 5.0,
          bottom: 5.0,
          top: 5.0,
        ),

        child: Center(
          child: ListTile(
            title: Text('Média', style: context.textStyles.bigTitle),
            trailing: StickerPercent(avarage: avarage,),
          ),
        ),
      ),
    );
  }
}
