import 'package:acad_facil/App/Core/Auth/auth.dart';
import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Widgets/text_button_app.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final userNameEC = TextEditingController();
  bool lookPassword = false;

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    userNameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height; 

    void nextScreen(){
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.loginScreen,
        (Route<dynamic> route) => false,
      );
    }
    
    void verifySuccess() async {
      var success = await Auth.registerUser(
        AuthModel(
          context: context,
          userName: userNameEC.text.trim(),
          email: emailEC.text.trim(),
          password: passwordEC.text.trim(),
        ),
      );

      if (success) nextScreen();
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Crie sua conta',
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
                      controller: userNameEC,
                      cursorColor: ColorsStyles.white,
                      style: context.textStyles.mainTitle,
          
                      decoration: InputDecoration(
                        label: Text(
                          'Nome de usuário',
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
          
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório!'),
                      ]),
                    ),
              
                    TextFormField(    
                      controller: emailEC,
                      cursorColor: ColorsStyles.white,
                      style: context.textStyles.mainTitle,
          
                      decoration: InputDecoration(
                        label: Text(
                          'E-mail',
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
          
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório!'),
                        Validatorless.email('E-Mail inválido!'),
                      ]),
                    ),
                    
                    TextFormField(    
                      controller: passwordEC,
                      cursorColor: ColorsStyles.white,
                      style: context.textStyles.mainTitle,
                      obscureText: !lookPassword ? true : false,
                    
                      decoration: InputDecoration(
                        label: Text(
                          'Senha',
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
          
                        suffixIcon: IconButton(
                          icon: Icon(
                            !lookPassword 
                              ? Icons.visibility 
                              : Icons.visibility_off,
                          ),
          
                          color: ColorsStyles.white,
          
                          onPressed: () {
                            setState(() {
                              lookPassword = !lookPassword;
                            });
                          },
                        ), 
                      ),
          
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório!'),
                        Validatorless.min(
                          8,
                          'Senha deve conter oito caracteres',
                        ),
                      ]),
                    ),
                    
                    SizedBox(height: height * .05,),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      
                      children: [ 
                        TextButtonApp(
                          title: 'Faça login',
                          action: () => nextScreen(),
                        ),
                      ],
                    ),
          
                    SizedBox(height: height * .02,),
                      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: [
                        Text(
                          'Cadastrar',
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
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
