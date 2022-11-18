import 'package:acad_facil/App/Controllers/user_controller.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class RegisterData extends StatefulWidget {
  const RegisterData({Key? key}) : super(key: key);

  @override
  State<RegisterData> createState() => _RegisterDataState();
}

class _RegisterDataState extends State<RegisterData> {
  final courseEC = TextEditingController();
  final periodEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    courseEC.dispose();
    periodEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    UserController providerUser = Provider.of<UserController>(context, listen: false);

    void registerData() async {
      final valid = formKey.currentState?.validate() ?? false;

      if (valid) {
        setState(() {
          isLoading = true;
        });

        await providerUser.addData(
          User(
            id: '',
            name: '',
            course: courseEC.text.trim(),
            period: int.tryParse(periodEC.text)!,
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
          title: Text(
            'Informe seus dados',
            style: context.textStyles.authTitle,
          ),

          elevation: 0,
          automaticallyImplyLeading: false,
        ),

        body: Align(
          alignment: Alignment.bottomCenter,
        
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
                    
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 45.0,
                  right: 45.0,
                  bottom: 20.0,
                ),
              
                child: Column(
                  children: [                
                    TextFormField(    
                      controller: courseEC,
                      style: context.textStyles.secundaryTitle,
          
                      decoration: const InputDecoration(
                        label: Text('Seu curso'),
                      ),
          
                      validator: Validatorless.required('Obrigatório!'),
                    ),
                  
                    TextFormField(    
                      controller: periodEC,
                      style: context.textStyles.secundaryTitle,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (_) => registerData(),
                    
                      decoration: const InputDecoration(
                        label: Text('Período Atual'),
                      ),
          
                      validator: Validatorless.required('Obrigatório!'),
                    ),
                  
                    SizedBox(height: height * .05,),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                      children: [
                        Text(
                          'Entrar',
                          style: context.textStyles.authTitle,
                        ),
                    
                        isLoading
                          ? CircularProgressIndicator(color: ColorsStyles.terciary,)
                          : Button(action: registerData)
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
