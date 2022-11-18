import 'package:acad_facil/App/Controllers/disciplines_controller.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Models/disciplines.dart';
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
  bool isLoading = false;

  @override
  void dispose() {
    gradeEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final disciplinesProvider = Provider.of<DisciplinesControler>(context);

    Disciplines disciplines =
        ModalRoute.of(context)!.settings.arguments as Disciplines;

    void registerGrade() async {
      final valid = formKey.currentState?.validate() ?? false;

      if (valid) {
        setState(() {
          isLoading = true;
        });
        
        await disciplinesProvider.addGrades(
          disciplines.id,
          disciplines.grades,
          double.tryParse(gradeEC.text)!
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
          title: const Text('Inserir Notas'),
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
                      controller: gradeEC,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => registerGrade(),
                      
                      decoration: const InputDecoration(
                        label: Text('Digite sua nota'),
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
                          : Button(action: registerGrade),
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
