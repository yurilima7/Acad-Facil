import 'package:acad_facil/App/Core/Styles/text_styles.dart';
import 'package:acad_facil/App/Screens/Login_Screen/Widgets/form_login.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
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
    
        body: const Align(
          alignment: Alignment.bottomCenter,
        
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 45.0,
                right: 45.0,
                bottom: 20.0,
              ),
            
              child: FormLogin()
            ),
          ),
        ),
      ),
    );
  }
}