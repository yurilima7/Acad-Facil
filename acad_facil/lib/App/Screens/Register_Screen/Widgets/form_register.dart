import 'package:acad_facil/App/Controllers/Auth/auth.dart';
import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/functions.dart';
import 'package:acad_facil/App/Core/Widgets/text_button_app.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({Key? key}) : super(key: key);

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final userNameEC = TextEditingController();
  bool lookPassword = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    userNameEC.dispose();
    super.dispose();
  }

  void screenLogin(String? text) async {
    final valid = formKey.currentState?.validate() ?? false;

    if (valid) {
      setState(() {
        isLoading = true;
      });

      await Auth().registerUser(
        AuthModel(
          userName: userNameEC.text.trim(),
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
            controller: userNameEC,
            cursorColor: ColorsStyles.white,
            style: context.textStyles.secundaryTitle,
            textInputAction: TextInputAction.next,
            
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
            onFieldSubmitted: screenLogin,
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
    
          SizedBox(
            height: height * .05,
          ),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButtonApp(
                title: 'Faça login',
                action: () => Functions().login(),
              ),
            ],
          ),
    
          SizedBox(
            height: height * .02,
          ),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
            children: [
              Text(
                'Cadastrar',
                style: context.textStyles.authTitle,
              ),

              isLoading
                ? CircularProgressIndicator(color: ColorsStyles.terciary,)
                : ElevatedButton(
                    onPressed: () => screenLogin(''),
                    style: context.buttonStyles.circleButton,
                    child: const Icon(Icons.arrow_forward),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
