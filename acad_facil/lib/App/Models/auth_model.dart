import 'package:flutter/material.dart';

class AuthModel with ChangeNotifier {
  final String email;
  final String password;
  final String userName;

  AuthModel({
    this.email = '',
    this.password = '',
    this.userName = '',
  });
}
