import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Widgets/app_bar_main.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Screens/Edit_Disciplines/edit_disciplines_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class EditDisciplines extends StatefulWidget {
  const EditDisciplines({super.key});

  @override
  State<EditDisciplines> createState() => _EditDisciplinesState();
}

class _EditDisciplinesState extends State<EditDisciplines> {
  final formKey = GlobalKey<FormState>();
  final formData = <String, Object>{};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arg = ModalRoute.of(context)?.settings.arguments;

    final discipline = arg as Disciplines;

    formData['id'] = discipline.id;
    formData['name'] = discipline.name;
    formData['classroom'] = discipline.classroom;
    formData['period'] = discipline.period;
    formData['grades'] = discipline.grades;
    formData['avarage'] = discipline.avarage;
  }

  @override
  Widget build(BuildContext context) {
    final disciplinesProvider = Provider.of<EditDisciplinesController>(context);
    final nav = Navigator.of(context);

    void registerDiscipline() async {
      final valid = formKey.currentState?.validate() ?? false;

      if (valid) {
        formKey.currentState?.save();

        final updateDisciplines = Disciplines(
          id: formData['id'].toString(),
          name: formData['name'].toString(),
          classroom: formData['classroom'].toString(),
          grades: formData['grades'] as List,
          period: formData['period'] as int,
          avarage: formData['avarage'] as double,
        );

        await disciplinesProvider.editDiscipline(
          updateDisciplines
        );

        if (disciplinesProvider.isSuccess) {
          nav.pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
        }
      }
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBarMain(
          titleStr: 'Editar Disciplina',
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
                      initialValue: formData['name'].toString(),
                      style: context.textStyles.secundaryTitle,
                      textInputAction: TextInputAction.next,
                      onSaved: (name) => formData['name'] = name ?? '',

                      decoration: InputDecoration(
                        label: Text(
                          'Disciplina',
                          style: context.textStyles.titleMedium,
                        ),
                      ),
                      
                      validator: Validatorless.required('Obrigatório!'),
                    ),

                    TextFormField(
                      initialValue: formData['classroom'].toString(),
                      style: context.textStyles.secundaryTitle,
                      textInputAction: TextInputAction.next,

                      onSaved: (classroom) =>
                          formData['classroom'] = classroom ?? '',

                      decoration: const InputDecoration(
                        label: Text('Sala'),
                      ),

                      validator: Validatorless.required('Obrigatório!'),
                    ),

                    TextFormField(
                      initialValue: formData['period'].toString(),
                      style: context.textStyles.secundaryTitle,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,

                      onFieldSubmitted: (_) => registerDiscipline(),

                      onSaved: (period) =>
                          formData['period'] = int.parse(period ?? ''),
                          
                      decoration: const InputDecoration(
                        label: Text('Período'),
                      ),

                      validator: Validatorless.required('Obrigatório!'),
                    ),

                    Button(title: 'Salvar', action: registerDiscipline),
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
