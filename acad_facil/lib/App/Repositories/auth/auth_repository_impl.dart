import 'dart:developer';

import 'package:acad_facil/App/Core/Data/constants_firebase.dart';
import 'package:acad_facil/App/Core/Exceptions/auth_exception.dart';
import 'package:acad_facil/App/Repositories/auth/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = ConstantsFirebase.auth;
  final GoogleSignIn _firebaseGoogle = ConstantsFirebase.googleSignIn;
  final FirebaseFirestore _firebaseFirestore = ConstantsFirebase.db;

  @override
  Future<User?> google() async {
    List<String>? loginMethods;
    try {
      final googleUser = await _firebaseGoogle.signIn();
      if (googleUser != null) {
        loginMethods =
            await _firebaseAuth.fetchSignInMethodsForEmail(googleUser.email);

        if (loginMethods.contains('password')) {
          throw AuthException(
              message: 'Você utilizou o e-mail para cadastro no Acad Fácil!');
        } else {
          final googleAuth = await googleUser.authentication;
          final firebaseCredential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

          final userCredential = await _firebaseAuth.signInWithCredential(firebaseCredential);

          return userCredential.user;
        }
      }
    } on FirebaseAuthException catch (e, s) {
      log(e.toString());
      log(s.toString());
      if (e.code == 'account-exists-with-different-credential') {
        throw AuthException(message: '''
          Login inválido você se registrou no Acad Fácil com os seguintes provedores:
            ${loginMethods?.join(',')}
        ''');
      } else {
        throw AuthException(message: 'Erro ao realizar login');
      }
    }

    return null;
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on PlatformException catch (e, s) {
      log(e.toString());
      log(s.toString());
      throw AuthException(message: e.message ?? 'Erro ao realizar login');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('Este e-mail não está cadastrado!');
        throw AuthException(message: 'Este e-mail não está cadastrado!');
      } else if (e.code == 'wrong-password') {
        log('Login ou senha inválidos!');
        throw AuthException(message: 'Login ou senha inválidos!');
      }

      throw AuthException(message: e.message ?? 'Erro ao realizar login');
    }
  }

  @override
  Future<void> register(String userName, String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      userCredential.user!.updateDisplayName(userName);
    } on FirebaseAuthException catch (e, s) {
      log(e.toString());
      log(s.toString());

      if (e.code == 'weak-password') {
        log("Senha não aceita, crie uma mais forte!");
        throw AuthException(
          message: 'Senha não aceita, crie uma mais forte!',
        );
      } else if (e.code == 'email-already-in-use') {
        final loginTypes =
            await _firebaseAuth.fetchSignInMethodsForEmail(email);

        if (loginTypes.contains('password')) {
          log("Este e-mail já está cadastrado!");
          throw AuthException(
            message: 'E-Mail já utilizado, por favor escolha outro e-mail',
          );
        } else {
          log("Este e-mail já está cadastrado pelo Google!");
          throw AuthException(
            message:
                'Você se cadastrou no Acad Fácil pelo Google, por favor utilize ele para entrar!!',
          );
        }
      }
    }
  }

  @override
  Future<void> logoutApp() async {
    try {
      await _firebaseFirestore.terminate();
      await _firebaseFirestore.clearPersistence();
      await _firebaseGoogle.signOut();
      _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e, s) {
      log('Falha no logout!');
      log(s.toString());
      throw AuthException(message: 'Falha ao sair do Acad Fácil!');
    }
  }
}
