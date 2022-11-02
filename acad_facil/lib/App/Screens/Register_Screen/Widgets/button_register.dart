import 'package:acad_facil/App/Controllers/Auth/auth.dart';
import 'package:acad_facil/App/Core/Styles/button_styles.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:flutter/material.dart';

class ButtonRegister extends StatefulWidget {
  final String email;
  final String password;
  final String userName;
  final GlobalKey<FormState> formKey;

  const ButtonRegister({
    Key? key,
    required this.email,
    required this.password,
    required this.userName,
    required this.formKey,
  }) : super(key: key);

  @override
  State<ButtonRegister> createState() => _ButtonRegisterState();
}

class _ButtonRegisterState extends State<ButtonRegister> {
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

                await Auth().registerUser(
                  AuthModel(
                    context: context,
                    userName: widget.userName,
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
