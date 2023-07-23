import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Screens/Grades_Screen/Widgets/card_avarage.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GradesScreen extends StatefulWidget {
  const GradesScreen({super.key});

  @override
  State<GradesScreen> createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
  List<Disciplines>? disciplines;
  int? period;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    disciplines = arguments['disciplines'] as List<Disciplines>;
    period = arguments['period'] as int;
  }

  @override
  Widget build(BuildContext context) {   
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Notas',
            style: context.textStyles.titleLarge,
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),

          child: Visibility(
            visible: disciplines!.isNotEmpty,

            replacement: Center(
              child: Text(
                'Sem notas no momento!',
                style: context.textStyles.secundaryTitle,
              ),
            ),

            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  disciplines!.length,
                  
                  (i) => ChangeNotifierProvider.value(
                    value: disciplines![i],
                    child: CardAvarage(
                      avarage: disciplines!.elementAt(i).avarage,
                      disciplina: disciplines!.elementAt(i).name,
                      discipline: disciplines!.elementAt(i),
                      disciplines: disciplines!,
                      period: period ?? 0,
                    ),
                  ),
                ),
              ),
            ) ,
          ),
        ),
      ),
    );
  }
}