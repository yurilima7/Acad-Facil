import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Screens/Register_Screen/Widgets/form_register.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
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

        body: const Align(
          alignment: Alignment.bottomCenter,

          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 45.0,
                right: 45.0,
                bottom: 20.0,
              ),

              child: FormRegister()
            ),
          ),
        ),
      ),
    );
  }
}
