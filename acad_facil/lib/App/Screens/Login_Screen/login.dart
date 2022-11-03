import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/functions.dart';
import 'package:acad_facil/App/Core/Widgets/text_button_app.dart';
import 'package:acad_facil/App/Screens/Login_Screen/Widgets/button_login.dart';
import 'package:acad_facil/App/Screens/Login_Screen/Widgets/google_login.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  bool lookPassword = false;

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Entre com',
            style: context.textStyles.authTitle,
          ),
    
          elevation: 0,
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
                      controller: emailEC,
                      cursorColor: ColorsStyles.white,
                      style: context.textStyles.secundaryTitle,
                      keyboardType: TextInputType.emailAddress,
          
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
                      style: context.textStyles.secundaryTitle,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                      children: [
                        const GoogleLogin(),
                    
                        TextButtonApp(
                          title: 'Cadastre-se',
                          action: () => Functions().registerScreen(context),
                        ),
                      ],
                    ),
          
                    SizedBox(height: height * .02,),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                      children: [
                        Text(
                          'Login',
                          style: context.textStyles.authTitle,
                        ),
                    
                        ButtonLogin(
                          email: emailEC.text.trim(),
                          password: passwordEC.text.trim(),
                          formKey: formKey,
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