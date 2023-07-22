import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Screens/Add_Grades/add_grades_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class AddGrades extends StatefulWidget {
  const AddGrades({Key? key}) : super(key: key);

  @override
  State<AddGrades> createState() => _AddGradesState();
}

class _AddGradesState extends State<AddGrades> {
  final formKey = GlobalKey<FormState>();
  final gradeEC = TextEditingController();

  @override
  void dispose() {
    gradeEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final disciplinesProvider = Provider.of<AddGradesController>(context);

    final Map<String, dynamic> resultArguments = 
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final Disciplines discipline = resultArguments['discipline'] as Disciplines;

    final List<Disciplines> listDisciplines = 
        resultArguments['listDisciplines'] as List<Disciplines>;
    
    final int period = resultArguments['period'] as int;

    final nav = Navigator.of(context);

    Future<void> registerGrade() async {
      final valid = formKey.currentState?.validate() ?? false;

      if (valid) {
        final resultAddGrade = await disciplinesProvider.addNewGrade(
            discipline, double.tryParse(gradeEC.text)!);

        if (resultAddGrade) {
          nav.pop({
            'discipline': discipline,
            'listDisciplines': listDisciplines,
            'period': period,
          });
        }
      }
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Inserir Notas'),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),

        body: Align(
          alignment: Alignment.bottomCenter,

          child: Padding(
            padding: const EdgeInsets.all(16.0),

            child: SingleChildScrollView(
              child: Form(
                key: formKey,

                child: Wrap(
                  runSpacing: 20,

                  children: [
                    TextFormField(
                      style: context.textStyles.secundaryTitle,
                      controller: gradeEC,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => registerGrade(),

                      decoration: const InputDecoration(
                        label: Text('Digite sua nota'),
                      ),

                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório!'),
                        Validatorless.numbersBetweenInterval(
                          0.0,
                          10.0,
                          'Sua nota deve ser entre 0.0 e 10',
                        ),
                      ]),
                    ),

                    Button(title: 'Salvar', action: registerGrade),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
