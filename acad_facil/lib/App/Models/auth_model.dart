import 'package:flutter/material.dart';

class AuthModel with ChangeNotifier {
  final String email;
  final String password;
  final String userName;

  AuthModel({
    required this.email,
    required this.password,
    required this.userName,
  }); 
}
