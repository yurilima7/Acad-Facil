import 'package:acad_facil/App/Models/user.dart';
import 'package:flutter/material.dart';

abstract class UserProvider {
  Future<void> loadUser();
  Future<void> addData(User user, BuildContext context, bool mounted);
  Future<void> deleteUser(BuildContext context, bool mounted);
}
