import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:acad_facil/App/Screens/Auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);
    
    return IconButton(
      onPressed: () async {
        final result = await AuthController().signInGoogle(
          AuthModel(),
        );

        if(result) {
          nav.pushNamedAndRemoveUntil(
            AppRoutes.home,
            (Route<dynamic> route) => false,
          );
        }
      },

      icon: SvgPicture.asset(
        'assets/images/google.svg',
        height: 35,
      ),
    );
  }
}
