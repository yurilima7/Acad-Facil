abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<void> register(String userName, String email, String password);
  Future<void> google();
}
