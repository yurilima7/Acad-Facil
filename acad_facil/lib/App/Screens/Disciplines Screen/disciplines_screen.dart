import 'package:acad_facil/App/Core/Widgets/grid_disciplines.dart';
import 'package:acad_facil/App/Screens/Disciplines%20Screen/search.dart';
import 'package:flutter/material.dart';

class DisciplinesScreen extends StatelessWidget {
  const DisciplinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disciplinas'),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Wrap(
            children: const [
              Search(),
              GridDisciplines(presentsAll: true)
            ],
          ),
        ),
      ),
    );
  }
}
