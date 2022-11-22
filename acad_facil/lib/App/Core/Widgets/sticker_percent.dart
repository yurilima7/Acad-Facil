import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class StickerPercent extends StatelessWidget {
  final double avarage;
  const StickerPercent({Key? key, required this.avarage}) : super(key: key);

  @override
  Widget build(BuildContext context) {   
    
    return Stack(
      alignment: Alignment.center,

      children: [
        Container(
          width: 50,
          height: 50,

          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),

          child: Center(
            child: Text(
              avarage.toStringAsFixed(2),
              style: context.textStyles.chartTitle,
            ),
          ),
        ),

        SizedBox(
          width: 50,
          height: 50,

          child: CircularProgressIndicator(
            value: avarage / 10.0,
            color: ColorsStyles.terciary,
            strokeWidth: 8,
            backgroundColor: ColorsStyles.white,
          ),
        ),
      ],
    );
  }
}
