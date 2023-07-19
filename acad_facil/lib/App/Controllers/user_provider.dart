import 'package:acad_facil/App/Models/user.dart';

abstract class UserProvider {
  Future<void> loadUser();
  Future<void> addData(UserModel user);
  Future<void> deleteUser();
}
