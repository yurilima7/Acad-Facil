import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CustomFirebase {
  /// FIRESTORE INSTANCE
  FirebaseFirestore get db => FirebaseFirestore.instance;
  /// FIREBASE AUTH INSTANCE
  FirebaseAuth get auth => FirebaseAuth.instance;
  /// CURRENT USER
  User? get user => FirebaseAuth.instance.currentUser;
  /// ID USER
  String get userId => FirebaseAuth.instance.currentUser!.uid;
  /// DOCUMENTO DA COLEÇÃO DO USUÁRIO
  DocumentReference<Map<String, dynamic>> get userDoc => FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid);
  /// COLEÇÃO DE DISCIPLINAS
  CollectionReference<Map<String, dynamic>> get disciplinesReference =>
      FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).collection('Disciplines');
  /// GOOGLE SIGN IN
  GoogleSignIn get googleSignIn => GoogleSignIn();
}
