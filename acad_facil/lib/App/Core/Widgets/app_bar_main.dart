import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:flutter/material.dart';

class AppBarMain extends AppBar {
  final String titleStr;
  final String? subTitleCenter, subTitleBottom, image;
  final bool description;

  AppBarMain({
    super.key,
    required this.titleStr,
    this.subTitleBottom,
    this.subTitleCenter,
    this.image,
    this.description = false,
  }) : super(
    title: Visibility(
      visible: !description,
      
      replacement: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleStr,
                style: TextStyles.i.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                subTitleCenter ?? '',
                style: TextStyles.i.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                subTitleBottom ?? '',
                style: TextStyles.i.titleMedium,
              ),
            ],
          ),

          Visibility(
            visible: image != null,
            child: CircleAvatar(
              backgroundImage: NetworkImage(image ?? ''),
              radius: 32,
            ),
          ),
        ],
      ),

      child: Text(titleStr, style: TextStyles.i.titleLarge,),
    ),

    elevation: 0,
    automaticallyImplyLeading: false,
    backgroundColor: description ? ColorsStyles.secundary : null,
    toolbarHeight: description ? 110 : null,
  );
}
