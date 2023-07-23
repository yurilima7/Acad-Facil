import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ConstantsFirebase {
  /// FIRESTORE INSTANCE
  static final db = FirebaseFirestore.instance;
  /// FIREBASE AUTH INSTANCE
  static final auth = FirebaseAuth.instance;
  /// CURRENT USER
  static final user = auth.currentUser;
  /// ID USER
  static final userId = auth.currentUser!.uid;
  /// COLEÇÃO DE USUÁRIO
  static final _userRefence = db.collection('Users');
  /// DOCUMENTO DA COLEÇÃO DO USUÁRIO
  static final userDoc = _userRefence.doc(userId);
  /// COLEÇÃO DE DISCIPLINAS
  static final disciplinesReference =
      userDoc.collection('Disciplines');
  /// GOOGLE SIGN IN
  static final googleSignIn = GoogleSignIn();
}
