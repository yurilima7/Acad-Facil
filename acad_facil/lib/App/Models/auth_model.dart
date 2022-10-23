import 'package:flutter/material.dart';

class AuthModel with ChangeNotifier {
  final String email;
  final BuildContext context;
  final String password;
  final String userName;

  AuthModel({
    this.email = '',
    this.password = '',
    this.userName = '',
    required this.context,
  });
}
