import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/network/base_client.dart';

class AuthServices {
  final BaseClient _client = BaseClient();
  final _storage = const FlutterSecureStorage();

  Future<dynamic> login(String phoneNumber) async {
    final response = await _client.post('users/login', {
      'phoneNumber': phoneNumber,
    });

    if (response != null && response['token'] != null) {
      await _storage.write(key: 'auth_token', value: response['token']);
    }
    return response;
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  Future<void> logout() async {
    await _storage.delete(key: 'auth_token');
  }
}
