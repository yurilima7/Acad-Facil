import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:acad_facil/App/Screens/Add_Disciplines/add_disciplines_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class AddDisciplines extends StatefulWidget {
  const AddDisciplines({super.key});

  @override
  State<AddDisciplines> createState() => _AddDisciplinesState();
}

class _AddDisciplinesState extends State<AddDisciplines> {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final classroomEC = TextEditingController();
  final periodEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    classroomEC.dispose();
    periodEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addDisciplinesController = Provider.of<AddDisciplinesController>(context);
    final nav = Navigator.of(context);

    void registerDiscipline() async {
      final valid = formKey.currentState?.validate() ?? false;

      if (valid) {
        await addDisciplinesController.registerDiscipline(
          Disciplines(
            id: '',
            name: nameEC.text.trim(),
            classroom: classroomEC.text.trim(),
            grades: [],
            period: int.tryParse(periodEC.text)!,
            avarage: 0.0,
          ),
        );

        if (addDisciplinesController.isSuccess) {
          nav.pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
        }
      }
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Inserir Disciplina'),
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
                      textInputAction: TextInputAction.next,
                      controller: nameEC,

                      decoration: InputDecoration(
                        label: Text(
                          'Disciplina',
                          style: context.textStyles.titleMedium,
                        ),
                      ),

                      validator: Validatorless.required('Obrigatório!'),
                    ),
                    TextFormField(
                      style: context.textStyles.secundaryTitle,
                      controller: classroomEC,
                      textInputAction: TextInputAction.next,

                      decoration: const InputDecoration(
                        label: Text('Sala'),
                      ),

                      validator: Validatorless.required('Obrigatório!'),
                    ),

                    TextFormField(
                      style: context.textStyles.secundaryTitle,
                      controller: periodEC,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,

                      onFieldSubmitted: (_) => registerDiscipline(),

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
