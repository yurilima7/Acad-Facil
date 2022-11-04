import 'dart:async';
import 'package:acad_facil/App/Core/Data/constants.dart';
import 'package:acad_facil/App/Core/Styles/colors_styles.dart';
import 'package:acad_facil/App/Core/Utils/functions.dart';
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

  verify() async{
    streamSubscription = Constants.auth
    .authStateChanges()
    .listen((User? user) {
      if (user == null) {
        Functions().login();
      } else {
        Functions().nextScreen();
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
            Image(
              image: const AssetImage('assets/images/logo.png'),
              width: MediaQuery.of(context).size.width * .5,
            ),

            const SizedBox(
              height: 50,
            ),

            SpinKitCircle(
              color: ColorsStyles.terciary,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
