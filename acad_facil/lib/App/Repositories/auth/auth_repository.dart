import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<void> register(String userName, String email, String password);
  Future<User?> google();
  Future<void> logoutApp();
}
