import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Screens/Grades_Screen/Widgets/card_avarage.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerDisciplines = Provider.of<DisciplinesControler>(context);
    final List<Disciplines> disciplines = providerDisciplines.disciplines;
    final int disciplinesLength = disciplines.length;
    
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20,),

        child: disciplinesLength > 0 ? SingleChildScrollView(
          child: Column(
            children: List.generate(
              disciplinesLength,
              
              (i) => ChangeNotifierProvider.value(
                value: disciplines[i],
                child: CardAvarage(
                  avarage: disciplines.elementAt(i).avarage,
                  disciplina: disciplines.elementAt(i).name,
                ),
              ),
            ),
          ),
        ) 
        : Center(
            child: Text(
              'Sem notas no momento!',
              style: context.textStyles.secundaryTitle,
            ),
          ),
      ),
    );
  }
}