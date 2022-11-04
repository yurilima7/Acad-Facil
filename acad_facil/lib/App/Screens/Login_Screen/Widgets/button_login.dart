import 'package:acad_facil/App/Controllers/Auth/auth.dart';
import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:flutter/material.dart';

class ButtonLogin extends StatefulWidget {
  final String email;
  final String password;
  final GlobalKey<FormState> formKey;

  const ButtonLogin({
    Key? key,
    required this.email,
    required this.password,
    required this.formKey,
  }) : super(key: key);

  @override
  State<ButtonLogin> createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator(color: ColorsStyles.terciary,)
        : ElevatedButton(
            onPressed: () async {
              final valid = widget.formKey.currentState?.validate() ?? false;

              if (valid) {
                setState(() {
                  isLoading = true;
                });

                await Auth().signInEmail(
                  AuthModel(
                    email: widget.email,
                    password: widget.password,
                  ),
                );

                setState(() {
                  isLoading = false;
                });
              }
            },
            style: context.buttonStyles.circleButton,
            child: const Icon(Icons.arrow_forward),
          );
  }
}
