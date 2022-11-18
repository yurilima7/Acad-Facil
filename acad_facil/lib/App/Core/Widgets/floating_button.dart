import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Utils/navigator_routes.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => NavigatorRoutes().addDisciplines(),
      backgroundColor: ColorsStyles.white,
      child: Icon(Icons.add, color: ColorsStyles.secundary, size: 32),
    );
  }
}
