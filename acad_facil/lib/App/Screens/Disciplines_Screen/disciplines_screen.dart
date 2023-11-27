import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Screens/Disciplines_Screen/Widgets/discipline_card.dart';
import 'package:acad_facil/App/Screens/Disciplines_Screen/Widgets/floating_button.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Screens/Disciplines_Screen/Widgets/search.dart';
import 'package:acad_facil/App/Screens/Disciplines_Screen/disciplines_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisciplinesScreen extends StatefulWidget {
  const DisciplinesScreen({super.key});

  @override
  State<DisciplinesScreen> createState() => _DisciplinesScreenState();
}

class _DisciplinesScreenState extends State<DisciplinesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final disciplines = arguments['disciplines'] as List<Disciplines>;
      final period = arguments['period'] as int;
      Provider.of<DisciplinesScreenController>(context, listen: false).add(disciplines, period);
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

              initialValue: disciplinesController.periodSelected,
    
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
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Search(
                      onChanged: (search) => disciplinesController.filter(search),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Disciplinas',
                      style: context.textStyles.secundaryTitle,
                    ),
                  ],
                ),
              ),
    
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
                      (i) => DisciplineCard(
                        discipline: disciplinesController.filtered[i],
                        disciplines: disciplinesController.filtered,
                        function: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.details,
                            arguments: {
                              "discipline": disciplinesController.filtered[i],
                              "listDisciplines": disciplinesController.filtered,
                              "period": disciplinesController.period,
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    
        floatingActionButton: FloatingButton(
          title: 'Adicionar Disciplina',
          function: () => Navigator.of(context).pushNamed(AppRoutes.addDisciplines),
        ),
      ),
    );
  }
}