import 'package:acad_facil/App/Core/Widgets/floating_button.dart';
import 'package:acad_facil/App/Screens/Disciplines_Screen/Widgets/grid_disciplines.dart';
import 'package:acad_facil/App/Screens/Disciplines_Screen/Widgets/search.dart';
import 'package:flutter/material.dart';

class DisciplinesScreen extends StatelessWidget {
  const DisciplinesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Disciplinas'),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
    
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children:  [
              Column(
                children: const [
                  Search(),      
                ],
              ),
          
              SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
          
              const GridDisciplines()
            ],
          ),
        ),

        floatingActionButton: const FloatingButton(),
      ),
    );
  }
}
