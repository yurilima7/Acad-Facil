import 'dart:async';
import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Utils/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  verify() async{
    streamSubscription = Constants.auth
    .authStateChanges()
    .listen((User? user) {
      if (user == null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.loginScreen,
          (Route<dynamic> route) => false,
        );
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.tabs,
          (Route<dynamic> route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: const AssetImage('assets/images/logo.png'),
          width: MediaQuery.of(context).size.width * .5,
        ),
      ),
    );
  }
}
