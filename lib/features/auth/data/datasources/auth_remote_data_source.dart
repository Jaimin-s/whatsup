import 'package:whatsup/core/network/base_client.dart';

abstract class AuthRemoteDataSource {
  Future<dynamic> login(String phoneNumber);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final BaseClient _client;

  AuthRemoteDataSourceImpl(this._client);

  @override
  Future<dynamic> login(String phoneNumber) async {
    return await _client.post('users/login', {'phoneNumber': phoneNumber});
  }
}
