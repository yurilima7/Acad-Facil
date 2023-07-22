import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Models/edit_grade_model.dart';
import 'package:acad_facil/App/Screens/Edit_Grade/edit_grade_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class EditGrade extends StatefulWidget {
  const EditGrade({Key? key}) : super(key: key);

  @override
  State<EditGrade> createState() => _EditGradeState();
}

class _EditGradeState extends State<EditGrade> {
  final formKey = GlobalKey<FormState>();
  final formData = <String, Object>{};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final arg = ModalRoute.of(context)?.settings.arguments;

    final grade = arg as EditGradeModel;

    formData['disciplineId'] = grade.disciplineId;
    formData['grades'] = grade.grades;
    formData['newGrade'] = grade.newGrade;
    formData['position'] = grade.position;
  }

  @override
  Widget build(BuildContext context) {
    final disciplinesProvider = Provider.of<EditGradeController>(context);
    final nav = Navigator.of(context);

    void registerGrade() async {
      final valid = formKey.currentState?.validate() ?? false;

      if (valid) {
        formKey.currentState?.save();

        final editModel = EditGradeModel(
          disciplineId: formData['disciplineId'].toString(),
          grades: formData['grades'] as List,
          newGrade: formData['newGrade'] as double,
          position: formData['position'] as int,
        );

        final updateGradeResult = await disciplinesProvider.editGrade(
          editModel,
        );

        if (updateGradeResult) {
          nav.pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
        }
      }
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Editar Nota'),
          elevation: 0,
          automaticallyImplyLeading: false,

          actions: [
            IconButton(
              onPressed: () async {
                final deleteResult = await disciplinesProvider.removeGrade(
                  EditGradeModel(
                    disciplineId: formData['disciplineId'].toString(),
                    grades: formData['grades'] as List,
                    newGrade: formData['newGrade'] as double,
                    position: formData['position'] as int,
                  ),
                );

                if (deleteResult) {
                  nav.pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
                }
              }, 
              
              icon: const Icon(Icons.delete, size: 32,),
            ),
          ],
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
                      initialValue: formData['newGrade'].toString(),
                      style: context.textStyles.secundaryTitle,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,

                      onFieldSubmitted: (_) => registerGrade(),

                      onSaved: (grade) =>
                          formData['newGrade'] = double.parse(grade ?? '0'),

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
