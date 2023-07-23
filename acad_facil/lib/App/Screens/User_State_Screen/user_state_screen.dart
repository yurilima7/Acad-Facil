import 'dart:async';
import 'package:acad_facil/App/Core/Data/constants_firebase.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserStateScreen extends StatefulWidget {
  const UserStateScreen({Key? key}) : super(key: key);

  @override
  State<UserStateScreen> createState() => _UserStateScreenState();
}

class _UserStateScreenState extends State<UserStateScreen> {
  late StreamSubscription streamSubscription;

  @override
  void initState() {
    verify();
    super.initState();
  }

  @override
  void dispose(){
    streamSubscription.cancel();
    super.dispose();
  }

  Future<void> verify() async{
    streamSubscription = ConstantsFirebase.auth
    .authStateChanges()
    .listen((User? user) {
      if (user == null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.loginScreen,
          (Route<dynamic> route) => false,
        );
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.home,
          (Route<dynamic> route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SpinKitThreeInOut(
              color: ColorsStyles.white,
            ),
          ],
        ),
      ),
    );
  }
}
