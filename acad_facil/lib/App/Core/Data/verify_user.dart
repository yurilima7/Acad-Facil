import 'dart:developer';
import 'package:acad_facil/App/Core/Data/constants_firebase.dart';

class VerifyUser {
  Future<int> verify() async {
    int existsUserData = 2; // erro encontrado
    try {
      var watch = 0;
      await ConstantsFirebase.userDoc.get().then((doc) {
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
