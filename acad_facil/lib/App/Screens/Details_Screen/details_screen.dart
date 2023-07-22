import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Utils/navigator_routes.dart';
import 'package:acad_facil/App/Core/Widgets/alert.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Screens/Details_Screen/Widgets/grid_grades.dart';
import 'package:acad_facil/App/Screens/Details_Screen/Widgets/local_avarage.dart';
import 'package:acad_facil/App/Screens/Details_Screen/details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final disciplinesProvider = Provider.of<DetailsScreenController>(context);
    final Map<String, dynamic> resultArguments = 
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final Disciplines discipline = resultArguments['discipline'] as Disciplines;

    final List<Disciplines> listDisciplines = 
        resultArguments['listDisciplines'] as List<Disciplines>;

    final nav = Navigator.of(context);

    Future<void> deleteDiscipline() async {
      var (list, result) = await disciplinesProvider.removeDiscipline(listDisciplines, discipline);

      if (result) {
        nav.popAndPushNamed(AppRoutes.disciplines, arguments: list,);
      }
    }

    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    discipline.name,
                    style: context.textStyles.titleLarge,
                  ),
                  Text(
                    'Sala: ${discipline.classroom}',
                    style: context.textStyles.titleMedium,
                  ),
                  Text(
                    'Período: ${discipline.period}°',
                    style: context.textStyles.titleMedium,
                  ),
                ],
              ),
            ],
          ),
    
          automaticallyImplyLeading: false,
          toolbarHeight: 110,
          elevation: 0,
          backgroundColor: ColorsStyles.secundary,
      ),
    
      body: Padding(
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
            
                    GridGrades(disciplines: discipline),
            
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
                          action: () => NavigatorRoutes().addGrades(discipline),
                          title: 'Adicionar nota',
                          description: true,
                        ),
                        Button(
                          action: () => NavigatorRoutes().editDiscipline(discipline),
                          title: 'Editar disciplina',
                          description: true,
                        ),
                        Button(
                          action: () => showDialog(
                            context: context,
                            builder: (_) => Alert(
                              action: deleteDiscipline,
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
              avarage: discipline.avarage,
            ),
          ],
        ),
      ),
    );
  }
}
