import 'package:acad_facil/App/Controllers/Auth/auth.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/functions.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Core/Widgets/text_button_app.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:acad_facil/App/Screens/Login_Screen/Widgets/google_login.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  bool lookPassword = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  void home() async {
    final valid = formKey.currentState?.validate() ?? false;

    if (valid) {
      setState(() {
        isLoading = true;
      });

      await Auth().signInEmail(
        AuthModel(
          email: emailEC.text.trim(),
          password: passwordEC.text.trim(),
        ),
      );

      setState(() {
        isLoading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Form(
      key: formKey,
      
      child: Column(
        children: [                
          TextFormField(    
            controller: emailEC,
            cursorColor: ColorsStyles.white,
            style: context.textStyles.secundaryTitle,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
              
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
            textInputAction: TextInputAction.done,
            obscureText: !lookPassword ? true : false,
            onFieldSubmitted: (_) => home(),
          
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
                action: () => Functions().registerScreen(),
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

              isLoading
                ? CircularProgressIndicator(color: ColorsStyles.terciary,)
                : Button(action: home),
            ],
          ),
        ],
      ),
    );
  }
}
