import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Core/Widgets/floating_button.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Screens/Disciplines_Screen/Widgets/grid_disciplines.dart';
import 'package:acad_facil/App/Screens/Disciplines_Screen/Widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisciplinesScreen extends StatefulWidget {
  const DisciplinesScreen({Key? key}) : super(key: key);

  @override
  State<DisciplinesScreen> createState() => _DisciplinesScreenState();
}

class _DisciplinesScreenState extends State<DisciplinesScreen> {
  String search = '';
  final searchEC = TextEditingController();

  @override
  void dispose() {
    searchEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerDisciplines = Provider.of<DisciplinesControler>(context);
    final List<Disciplines> disciplines = providerDisciplines.disciplines;

    void onChanged(String text){
      setState(() {
        search = searchEC.text;
      });
    }

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
                children: [
                  Search(onChanged: onChanged, controller: searchEC),       
                ],
              ),
          
              SizedBox(height: MediaQuery.of(context).size.height * 0.06,),

              GridDisciplines(disciplines: disciplines, search: search,),
            ],
          ),
        ),

        floatingActionButton: const FloatingButton(),
      ),
    );
  }
}