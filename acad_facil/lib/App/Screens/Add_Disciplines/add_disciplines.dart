import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class AddDisciplines extends StatefulWidget {
  const AddDisciplines({Key? key}) : super(key: key);

  @override
  State<AddDisciplines> createState() => _AddDisciplinesState();
}

class _AddDisciplinesState extends State<AddDisciplines> {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final classroomEC = TextEditingController();
  final periodEC = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    nameEC.dispose();
    classroomEC.dispose();
    periodEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final disciplinesProvider = Provider.of<DisciplinesControler>(context);

    void registerDiscipline() async {
      final valid = formKey.currentState?.validate() ?? false;

      if (valid) {
        setState(() {
          isLoading = true;
        });
        
        await disciplinesProvider.addDisciplines(
          Disciplines(
            id: '',
            name: nameEC.text.trim(),
            classroom: classroomEC.text.trim(),
            grades: [],
            period: int.tryParse(periodEC.text)!,
            avarage: 0.0,
          ),
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
          title: const Text('Inserir Disciplina'),
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
                      style: context.textStyles.secundaryTitle,
                      textInputAction: TextInputAction.next,
                      controller: nameEC,
                      
                      decoration: InputDecoration(
                        label: Text(
                          'Disciplina',
                          style: context.textStyles.mainTitle,
                        ),
                      
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorsStyles.white,
                          ),
                        ),
                        
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorsStyles.white,
                          ),
                        ),
                      ),
                      
                      validator: Validatorless.required('Obrigat??rio!'),
                    ),
                
                    TextFormField(
                      style: context.textStyles.secundaryTitle,
                      controller: classroomEC,
                      textInputAction: TextInputAction.next,
                      
                      decoration: const InputDecoration(
                        label: Text('Sala'),
                      ),
                      
                      validator: Validatorless.required('Obrigat??rio!'),
                    ),
                
                    TextFormField(    
                      style: context.textStyles.secundaryTitle,
                      controller: periodEC,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => registerDiscipline(),
                      
                      decoration: const InputDecoration(
                        label: Text( 'Per??odo'),
                      ),
                      
                      validator: Validatorless.required('Obrigat??rio!'),
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
                      children: [
                        Text(
                          'Salvar',
                          style: context.textStyles.authTitle,
                        ),
            
                        isLoading
                          ? CircularProgressIndicator(color: ColorsStyles.terciary,)
                          : Button(action: registerDiscipline),
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
