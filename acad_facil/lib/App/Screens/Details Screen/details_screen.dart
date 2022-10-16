import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {

  const DetailsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Disciplines disciplines =
        ModalRoute.of(context)!.settings.arguments as Disciplines;

    return Scaffold(
      appBar: AppBar(
        title: Text(disciplines.name),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Scaffold(),
    );
  }
}