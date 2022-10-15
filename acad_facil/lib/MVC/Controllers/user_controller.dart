import 'package:acad_facil/Data/dummy_user.dart';
import 'package:acad_facil/MVC/Models/user.dart';
import 'package:flutter/material.dart';

class UserController with ChangeNotifier {

  final User _user = dummyUser;
  User get user => _user;
  
}