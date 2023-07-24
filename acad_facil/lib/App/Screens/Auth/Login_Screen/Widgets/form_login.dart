import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Data/verify_user.dart';
import 'package:acad_facil/App/Core/Widgets/button.dart';
import 'package:acad_facil/App/Core/Widgets/text_button_app.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:acad_facil/App/Screens/Auth/Login_Screen/Widgets/google_login.dart';
import 'package:acad_facil/App/Screens/Auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
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
    final nav = Navigator.of(context);
    final authController = Provider.of<AuthController>(context);

    Future<void> home() async {
      final valid = formKey.currentState?.validate() ?? false;

      if (valid) {
        await authController.signInEmail(
          AuthModel(
            userName: '',
            email: emailEC.text.trim(),
            password: passwordEC.text.trim(),
          ),
        );


        if (authController.isSuccess) {
          final verifyResult = await VerifyUser().verify();

          if (verifyResult == 1) {
            nav.pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
          } else if (verifyResult == 0) {
            nav.pushNamedAndRemoveUntil(AppRoutes.registerDataScreen, (route) => false);
          }
        }
      }
    }

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Text(
            'Entre com',
            style: context.textStyles.titleLarge,
          ),

          const SizedBox(
            height: 25,
          ),

          TextFormField(
            controller: emailEC,
            style: context.textStyles.secundaryTitle,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,

            decoration: const InputDecoration(
              label: Text(
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

            obscureText: !lookPassword ? true : false,

            onFieldSubmitted: (_) => home(),

            decoration: InputDecoration(
              label: const Text(
                'Senha',
              ),

              suffixIcon: IconButton(
                icon: Icon(
                  !lookPassword ? Icons.visibility : Icons.visibility_off,
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

          const SizedBox(
            height: 25,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              const GoogleLogin(),

              TextButtonApp(
                title: 'Cadastre-se',
                function: () =>
                    Navigator.of(context).pushNamed(AppRoutes.registerScreen),
              ),
            ],
          ),

          const SizedBox(
            height: 25,
          ),

          Button(
            action: home,
            title: 'Login',
          ),
        ],
      ),
    );
  }
}
