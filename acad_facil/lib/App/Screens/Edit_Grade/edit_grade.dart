import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Models/edit_grade_model.dart';
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
  bool isLoading = false;
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
    final disciplinesProvider = Provider.of<DisciplinesControler>(context);

    void registerGrade() async {
      final valid = formKey.currentState?.validate() ?? false;

      if (valid) {
        formKey.currentState?.save();

        setState(() {
          isLoading = true;
        });

        await disciplinesProvider.editGrade(
          formData['disciplineId'].toString(),
          formData['grades'] as List,
          formData['newGrade'] as double,
          formData['position'] as int,
        );

        setState(() {
          isLoading = false;
        });
      }
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Editar Nota'),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Wrap(
                  runSpacing: MediaQuery.of(context).size.height * 0.02,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Salvar',
                          style: context.textStyles.titleLarge,
                        ),
                        isLoading
                            ? CircularProgressIndicator(
                                color: ColorsStyles.terciary,
                              )
                            : Button(title: 'Salvar', action: registerGrade),
                      ],
                    ),
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
