import 'package:acad_facil/App/Controllers/user_provider.dart';
import 'package:acad_facil/App/Core/Data/dummy_user.dart';
import 'package:acad_facil/App/Models/user.dart';
import 'package:flutter/material.dart';

class UserController with ChangeNotifier implements UserProvider {

  final User _user = dummyUser;
  User get user => _user;
  
  @override
  Future<void> editName() {
    throw UnimplementedError();
  }
  
  @override
  Future<void> loadUser() {
    throw UnimplementedError();
  }
  
}