import 'package:acad_facil/App/Controllers/user_controller.dart';
import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Utils/messages.dart';
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

  @override
  void dispose() {
    courseEC.dispose();
    periodEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var providerUser = Provider.of<UserController>(context, listen: false);

    void nextScreen() {  
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.tabs,
        (Route<dynamic> route) => false,
      );
    }

    void verifySuccess() async {
      await providerUser.addData(
        User(
          id: '',
          name: '',
          course: courseEC.text.trim(),
          period: int.tryParse(periodEC.text)!,
        ),
      );

      if (!mounted) return;
      Messages.showSuccess(context, 'Dados inseridos com sucesso!');
      Future.delayed(const Duration(seconds: 3), nextScreen);     
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
                padding: const EdgeInsets.only(left: 45.0, right: 45.0,),
              
                child: Column(
                  children: [                
                    TextFormField(    
                      controller: courseEC,
                      cursorColor: ColorsStyles.white,
                      style: context.textStyles.secundaryTitle,
          
                      decoration: InputDecoration(
                        label: Text(
                          'Seu curso',
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
                      controller: periodEC,
                      cursorColor: ColorsStyles.white,
                      style: context.textStyles.secundaryTitle,
                      keyboardType: TextInputType.number,
                    
                      decoration: InputDecoration(
                        label: Text(
                          'Período Atual',
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
                  
                    SizedBox(height: height * .05,),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                      children: [
                        Text(
                          'Entrar',
                          style: context.textStyles.authTitle,
                        ),
                    
                        ElevatedButton(
                          onPressed: () {
                            final valid =
                                formKey.currentState?.validate() ??
                                    false;
          
                            if (valid) {
                              verifySuccess();
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
