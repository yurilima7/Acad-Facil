import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/discipline_card.dart';
import 'package:acad_facil/App/Core/Widgets/floating_button.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Screens/Disciplines_Screen/Widgets/search.dart';
import 'package:acad_facil/App/Screens/Disciplines_Screen/disciplines_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisciplinesScreen extends StatefulWidget {
  const DisciplinesScreen({Key? key}) : super(key: key);

  @override
  State<DisciplinesScreen> createState() => _DisciplinesScreenState();
}

class _DisciplinesScreenState extends State<DisciplinesScreen> {
  List<Disciplines>? disciplines;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disciplines = ModalRoute.of(context)!.settings.arguments 
                    as List<Disciplines>;
                     Provider.of<DisciplinesScreenController>(context)
          .add(disciplines!);
  }

  @override
  Widget build(BuildContext context) {
    final disciplinesController 
        = Provider.of<DisciplinesScreenController>(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      
      child: Scaffold(
        appBar: AppBar(
          title: Text('Disciplinas', style: context.textStyles.titleLarge,),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
    
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children:  [
              Column(
                children: [
                  Search(
                    onChanged: (value) => disciplinesController.filter(value),
                  ),       
                ],
              ),
          
              SizedBox(height: MediaQuery.of(context).size.height * 0.06,),

              Visibility(
                visible: disciplinesController.filtered.isNotEmpty,

                replacement: Expanded(
                  child: Center(
                    child: Text(
                      'Sem disciplinas no momento!',
                      style: context.textStyles.secundaryTitle,
                    ),
                  ),
                ),

                child: Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 10.0,

                    children: List.generate(
                      disciplinesController.filtered.length,
                      (i) => DisciplineCard(discipline: disciplinesController.filtered[i]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: const FloatingButton(),
      ),
    );
  }
}