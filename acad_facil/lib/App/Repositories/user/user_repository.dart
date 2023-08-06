import 'package:acad_facil/App/Models/user.dart';

abstract class UserRepository {
  Future<UserModel?> loadUser();
  Future<void> addData(UserModel user);
  Future<void> updateUser(UserModel user);
  Future<void> deleteUser();
}
