import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Constants {
  static final db = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  static final user = auth.currentUser;
  static final userId = auth.currentUser!.uid;
  static final userRefence = db.collection('Users');
  static final idUserCollection = userRefence.doc(userId);
  static final disciplinesReference =
      idUserCollection.collection('Disciplines');
  static final schedulesReference = 
      idUserCollection.collection('Schedules');
  static final googleSignIn = GoogleSignIn();
}
