import 'package:acad_facil/App/Models/user.dart';

abstract class UserProvider {
  Future<void> loadUser();
  Future<void> editData(User user);
  Future<void> addData(User user);
  Future<void> deleteUser(User user);
}
