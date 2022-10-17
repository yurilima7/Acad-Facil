import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/sticker_percent.dart';
import 'package:flutter/material.dart';

class LocalAvarage extends StatelessWidget {
  final double avarage;
  const LocalAvarage({Key? key, required this.avarage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 100,
      padding: const EdgeInsets.all(20.0),

      decoration: BoxDecoration(
        color: ColorsStyles.secundary,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
          Text('Média', style: context.textStyles.bigTitle),
          StickerPercent(avarage: avarage,),
        ],
      ),
    );
  }
}
