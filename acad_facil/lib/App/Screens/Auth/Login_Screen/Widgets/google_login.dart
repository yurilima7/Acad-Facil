import 'package:acad_facil/App/Core/Data/verify_user.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:acad_facil/App/Core/Utils/assets.dart';
import 'package:acad_facil/App/Screens/Auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);
    final authController = Provider.of<AuthController>(context);
    
    return IconButton(
      onPressed: () async {
        await authController.signInGoogle();

        if(authController.isSuccess) {
          final verifyResult = await VerifyUser().verify();

          if (verifyResult == 1) {
            nav.pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
          } else if (verifyResult == 0) {
            nav.pushNamedAndRemoveUntil(AppRoutes.registerDataScreen, (route) => false);
          }
        }
      },

      icon: CircleAvatar(
        backgroundColor: Colors.white,
        child: SvgPicture.asset(
          Assets.google,
          height: 35,
        ),
      ),
    );
  }
}
