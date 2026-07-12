import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage _storage;

  AuthLocalDataSourceImpl(this._storage);

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  @override
  Future<String?> getToken() async {
    await _storage.read(key: 'auth_token');
    return null;
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: 'auth_token');
  }
}
