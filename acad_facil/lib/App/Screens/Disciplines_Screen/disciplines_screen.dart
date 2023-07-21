import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/navigator_routes.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final disciplines = ModalRoute.of(context)!.settings.arguments as List<Disciplines>;
      Provider.of<DisciplinesScreenController>(context, listen: false).add(disciplines, 9);
    });
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
          actions: [

            PopupMenuButton<int>(
              color: ColorsStyles.secundary,

              icon: Icon(
                Icons.filter_list,
                color: ColorsStyles.white,
              ),

              onSelected: (period) => disciplinesController.updatePeriod(period),

              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0, // 0 para mostrar todas as disciplinas
                    child: Text(
                      'Todas as disciplinas',
                      style: context.textStyles.titleMedium,
                    ),
                  ),

                  for (int period in disciplinesController.periodsWithoutZero)
                    PopupMenuItem<int>(
                      value: period,
                      child: Text(
                        'Período $period',
                        style: context.textStyles.titleMedium,
                      ),
                    ),
                ];
              },
            ),
          ],
        ),
    
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: Column(
            children:  [
              Column(
                children: [
                  Search(
                    onChanged: (search) => disciplinesController.filter(search),
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

        floatingActionButton: FloatingButton(
          title: 'Adicionar Disciplina',
          function: () => NavigatorRoutes().addDisciplines(),
        ),
      ),
    );
  }
}