import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/alert.dart';
import 'package:acad_facil/App/Core/Widgets/floating_button.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Screens/Details_Screen/Widgets/modal_options.dart';
import 'package:acad_facil/App/Screens/Details_Screen/Widgets/grid_grades.dart';
import 'package:acad_facil/App/Screens/Details_Screen/Widgets/local_avarage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final disciplinesProvider = Provider.of<DisciplinesControler>(context);
    Disciplines disciplines =
        ModalRoute.of(context)!.settings.arguments as Disciplines;

    void deleteDiscipline() {
      disciplinesProvider.deleteDisciplines(disciplines);
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
                    disciplines.name,
                    style: context.textStyles.titleLarge,
                  ),
                  Text(
                    'Sala: ${disciplines.classroom}',
                    style: context.textStyles.titleMedium,
                  ),
                  Text(
                    'Período: ${disciplines.period}°',
                    style: context.textStyles.titleMedium,
                  ),
                ],
              ),
            ],
          ),

          actions: [
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (_) => Alert(
                  action: deleteDiscipline,
                  message: 'Deseja deletar esta disciplina?',
                  position: 0,
                ),
              ),

              icon: const Icon(Icons.delete, size: 45),
            ),
          ],

          automaticallyImplyLeading: false,
          toolbarHeight: 110,
          elevation: 0,
          backgroundColor: ColorsStyles.secundary,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          bottom: 70.0,
        ),
        child: Column(
          children: [
            const SizedBox(
                    height: 45,
                ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 10,
                  children: [
                    Text(
                      'Notas',
                      style: context.textStyles.titleMedium,
                    ),
                    GridGrades(disciplines: disciplines),
                  ],
                ),
              ),
            ),
            LocalAvarage(
              avarage: disciplines.avarage,
            ),
          ],
        ),
      ),
      
      floatingActionButton: FloatingButton(
        title: 'Opções',
        function: () => showModalBottomSheet(
          context: context,
          builder: (BuildContext _) {
            return ModalOptions(disciplines: disciplines);
          },
        ),
      ),
    );
  }
}
