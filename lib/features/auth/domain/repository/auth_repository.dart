abstract class AuthRepository {
  Future<dynamic> login(String phoneNumber);
  Future<String?> getToken();
  Future<void> logout();
}
