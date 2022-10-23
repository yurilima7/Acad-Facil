import 'package:acad_facil/App/Core/Auth/auth.dart';
import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
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

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

        child: Form(
          key: formKey,
                
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0,),
            
                child: Column(
                  children: [
                    SizedBox(
                      height: height * .1,
                
                      child: Row(
                        children: [
                          Text(
                            'Entre com',
                            style: context.textStyles.authTitle,
                          ),
                        ],
                      ),
                    ),
                      
                    SizedBox(
                      height: height * .85,
                      
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 25.0,),
                      
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                      
                            children: [
            
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
                                obscureText: !lookPassword ? false : true,
                              
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
                      
                              SizedBox(height: constraints.maxHeight * .1,),
                      
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
                                    action: () {},
                                  ),
                                ],
                              ),

                              SizedBox(height: constraints.maxHeight * .02,),
                          
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
                                        Auth.signInEmail(
                                          AuthModel(
                                            context: context,
                                            email: emailEC.text,
                                            password: passwordEC.text,
                                          ),
                                        );
                                      }
                                    },
                                    style: context.buttonStyles.circleButton,
                                    child: const Icon(Icons.arrow_forward),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
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