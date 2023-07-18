import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/alert.dart';
import 'package:acad_facil/App/Core/Widgets/information_card.dart';
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
        title: Text(disciplines.name),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ModalOptions(disciplines: disciplines);
              },
            ),
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: 10,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Wrap(
                  runSpacing: MediaQuery.of(context).size.height * 0.06,
                  children: [
                    InformationCard(
                      title: "Sala ${disciplines.classroom}",
                      subTitle: "Periodo: ${disciplines.period}°",
                    ),
                    Wrap(
                      alignment: WrapAlignment.start,
                      runSpacing: 9,
                      children: [
                        Text(
                          'Notas',
                          style: context.textStyles.titleMedium,
                        ),
                        GridGrades(disciplines: disciplines),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delete a disciplina',
                          style: context.textStyles.titleMedium,
                        ),
                        IconButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (_) => Alert(
                              action: deleteDiscipline,
                              message: 'Deseja deletar esta disciplina?',
                              position: 0,
                            ),
                          ),
                          icon: Icon(
                            Icons.delete,
                            size: 28,
                            color: ColorsStyles.white,
                          ),
                        ),
                      ],
                    ),
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
    );
  }
}
