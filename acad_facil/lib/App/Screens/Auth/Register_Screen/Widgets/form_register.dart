import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Utils/navigator_routes.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Core/Widgets/text_button_app.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:acad_facil/App/Screens/Auth/auth_controller.dart';
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
    final nav = Navigator.of(context);
    
    void screenLogin() async {
      final valid = formKey.currentState?.validate() ?? false;

      if (valid) {
        final result = await AuthController().registerUser(
          AuthModel(
            userName: userNameEC.text.trim(),
            email: emailEC.text.trim(),
            password: passwordEC.text.trim(),
          ),
        );

        if(result) {
          nav.pushNamedAndRemoveUntil(
            AppRoutes.loginScreen,
            (Route<dynamic> route) => false,
          );
        }
      }
    }

    return Form(
      key: formKey,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'Crie sua conta',
            style: context.textStyles.titleLarge,
          ),

          const SizedBox(
            height: 25,
          ),

          TextFormField(
            controller: userNameEC,
            style: context.textStyles.secundaryTitle,
            textInputAction: TextInputAction.next,
            
            decoration: const InputDecoration(
              label: Text(
                'Nome de usuário',
              ),
            ),
    
            validator: Validatorless.multiple([
              Validatorless.required('Obrigatório!'),
            ]),
          ),
    
          TextFormField(
            controller: emailEC,
            style: context.textStyles.secundaryTitle,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
    
            decoration: const InputDecoration(
              label:  Text(
                'E-mail',
              ),
            ),
    
            validator: Validatorless.multiple([
              Validatorless.required('Obrigatório!'),
              Validatorless.email('E-Mail inválido!'),
            ]),
          ),
          
          TextFormField(
            controller: passwordEC,
            style: context.textStyles.secundaryTitle,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => screenLogin(),
            obscureText: !lookPassword ? true : false,
    
            decoration: InputDecoration(
    
              label: const Text('Senha'),
    
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
                action: () => NavigatorRoutes().login(),
              ),
            ],
          ),
    
          SizedBox(
            height: height * .02,
          ),

          Button(title: 'Cadastrar', action: screenLogin),
        ],
      ),
    );
  }
}
