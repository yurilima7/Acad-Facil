import 'package:acad_facil/App/Controllers/Auth/auth.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({Key? key}) : super(key: key);

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading 
      ? CircularProgressIndicator(color: ColorsStyles.white,)
      : IconButton(
        onPressed: () async {
          setState(() {
            isLoading = true;
          });

          await Auth().signInGoogle(
            AuthModel(),
          );

          setState(() {
            isLoading = false;
          });
        },
        icon: SvgPicture.asset(
          'assets/images/google.svg',
          height: 35,
        ),
      );
  }
}
