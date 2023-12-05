import 'dart:developer';
import 'package:acad_facil/App/Core/Data/custom_firebase.dart';

class VerifyUser {
  Future<int> verify() async {
    int existsUserData = 2; // erro encontrado
    try {
      var watch = 0;
      await CustomFirebase().userDoc.get().then((doc) {
        if (doc.exists) {
          watch = 1;
        }

        existsUserData = watch;
      });
    } catch (e) {
      log(e.toString());
    }

    return existsUserData;
  }
}
