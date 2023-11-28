import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Widgets/alert.dart';
import 'package:acad_facil/App/Core/Widgets/app_bar_main.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Screens/Details_Screen/Widgets/grid_grades.dart';
import 'package:acad_facil/App/Screens/Details_Screen/Widgets/local_avarage.dart';
import 'package:acad_facil/App/Screens/Details_Screen/details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final Map<String, dynamic> resultArguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

      final Disciplines discipline =
          resultArguments['discipline'] as Disciplines;

      final List<Disciplines> listDisciplines =
          resultArguments['listDisciplines'] as List<Disciplines>;

      final int nowPeriod = resultArguments['period'] as int;

      Provider.of<DetailsScreenController>(context, listen: false)
          .addDataDiscipline(listDisciplines, discipline, nowPeriod);
    });
  }

  @override
  Widget build(BuildContext context) {
    final detailsScreenController = Provider.of<DetailsScreenController>(context);
    final discipline = detailsScreenController.discipline;
    final listDisciplines = detailsScreenController.listDisciplines;

    final nav = Navigator.of(context);

    Future<void> deleteDiscipline() async {
      await detailsScreenController.removeDiscipline(
          listDisciplines, discipline!);

      if (detailsScreenController.isSuccess) {
        nav.pushNamedAndRemoveUntil(
          AppRoutes.home,
          (route) => false,
        );
      }
    }

    return Scaffold(
      appBar: AppBarMain(
        titleStr: discipline?.name ?? '',
        subTitleCenter: 'Sala: ${discipline?.classroom}',
        subTitleBottom: 'Período: ${discipline?.period}°',
        description: true,
      ),

      body: Visibility(
        visible: listDisciplines.isNotEmpty && discipline != null,
        replacement: const SizedBox.shrink(),

        child: Padding(
          padding: const EdgeInsets.all(16.0),
      
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
      
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
      
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
      
                      Text(
                        'Notas',
                        style: context.textStyles.titleMedium,
                      ),
      
                      Visibility(
                        visible: discipline != null,
                        replacement: const SizedBox.shrink(),
                        child: GridGrades(disciplines: discipline),
                      ),
      
                      const SizedBox(
                        height: 45,
                      ),
      
                      Text(
                        'Opções',
                        style: context.textStyles.titleMedium,
                      ),
      
                      Column(
                        children: [
                          Button(
                            action: () async {
                              final resultAddGrade =
                                  await Navigator.of(context).pushNamed(
                                AppRoutes.addGrades,
                                arguments: {
                                  "discipline": discipline,
                                  "listDisciplines": listDisciplines,
                                  "period": detailsScreenController.period,
                                },
                              );
      
                              if (resultAddGrade != null && resultAddGrade is Map<String, dynamic>) {
                                detailsScreenController.addDataDiscipline(
                                  resultAddGrade['listDisciplines'] as List<Disciplines>,
                                  resultAddGrade['discipline'] as Disciplines,
                                  resultAddGrade['period'] as int,
                                );
                              }
                            },
      
                            title: 'Adicionar nota',
                            description: true,
                          ),
      
                          Button(
                            action: () => Navigator.of(context).pushNamed(
                              AppRoutes.editDisciplines,
                              arguments: discipline,
                            ),
                            title: 'Editar disciplina',
                            description: true,
                          ),

                          Button(
                            action: () => showDialog(
                              context: context,
                              builder: (_) => Alert(
                                function: deleteDiscipline,
                                message: 'Deseja deletar esta disciplina?',
                                position: 0,
                              ),
                            ),
                            title: 'Deletar disciplina',
                            description: true,
                            error: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              LocalAvarage(
                avarage: discipline?.avarage ?? 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
