import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
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
                      cursorColor: ColorsStyles.white,
                      style: context.textStyles.secundaryTitle,
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
                      
                      validator: Validatorless.required('Obrigatório!'),
                    ),
                
                    TextFormField(    
                      cursorColor: ColorsStyles.white,
                      style: context.textStyles.secundaryTitle,
                      controller: classroomEC,
                      
                      decoration: InputDecoration(
                        label: Text(
                          'Sala',
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
                      
                      validator: Validatorless.required('Obrigatório!'),
                    ),
                
                    TextFormField(    
                      cursorColor: ColorsStyles.white,
                      style: context.textStyles.secundaryTitle,
                      controller: periodEC,
                      keyboardType: TextInputType.number,
                      
                      decoration: InputDecoration(
                        label: Text(
                          'Período',
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
                      
                      validator: Validatorless.required('Obrigatório!'),
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
                          : ElevatedButton(
                              onPressed: () async {
                                  final valid =
                                      formKey.currentState?.validate() ?? false;
            
                                  if (valid) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    
                                    await disciplinesProvider.addDisciplines(
                                      Disciplines(
                                        id: '',
                                        name: nameEC.text.trim(),
                                        classroom: classroomEC.text.trim(),
                                        grades: {},
                                        period: int.tryParse(periodEC.text)!,
                                        schedule: {},
                                        avarage: 0.0,
                                      ),
                                      mounted,
                                      context
                                    );
            
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                              },
                              style: context.buttonStyles.circleButton,
                              child: const Icon(Icons.arrow_forward),
                            ),
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
