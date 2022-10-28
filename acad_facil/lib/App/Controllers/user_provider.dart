import 'package:acad_facil/App/Models/user.dart';
import 'package:flutter/material.dart';

abstract class UserProvider {
  Future<void> loadUser();
  Future<void> editData(User user);
  Future<void> addData(User user, BuildContext context);
  Future<void> deleteUser(User user);
}
