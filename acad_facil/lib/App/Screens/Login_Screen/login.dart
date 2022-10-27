import 'package:acad_facil/App/Core/Auth/auth.dart';
import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Widgets/text_button_app.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

    void registerScreen(){
      Navigator.of(context).pushNamed(
        AppRoutes.registerScreen,
      );
    }

    void login() async {
      await Auth().signInEmail(
        AuthModel(
          context: context,
          email: emailEC.text.trim(),
          password: passwordEC.text.trim(),
        ),
      );
    }

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
                padding: const EdgeInsets.only(left: 45.0, right: 45.0,),
              
                child: Column(
                  children: [                
                    TextFormField(    
                      controller: emailEC,
                      cursorColor: ColorsStyles.white,
                      style: context.textStyles.secundaryTitle,
          
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
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/images/google.svg',
                            height: 35,
                          ),
                        ),
                    
                        TextButtonApp(
                          title: 'Cadastre-se',
                          action: () => registerScreen(),
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
                    
                        ElevatedButton(
                          onPressed: () {
                            final valid =
                                formKey.currentState?.validate() ??
                                    false;
          
                            if (valid) {
                              login();
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