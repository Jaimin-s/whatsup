import 'package:whatsup/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:whatsup/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:whatsup/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remotedatasource;
  final AuthLocalDataSource localdatasource;

  AuthRepositoryImpl({
    required this.localdatasource,
    required this.remotedatasource,
  });

  @override
  Future<dynamic> login(String phoneNumber) async {
    final response = await remotedatasource.login(phoneNumber);

    if (response != null && response['token'] != null) {
      await localdatasource.saveToken(response['token']);
    }
    return response;
  }

  @override
  Future<String?> getToken() async {
    return await localdatasource.getToken();
  }

  @override
  Future<void> logout() async {
    return await localdatasource.deleteToken();
  }
}
