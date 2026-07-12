import 'package:whatsup/features/auth/domain/repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<dynamic> call(String phoneNumber) async {
    return await repository.login(phoneNumber);
  }
}
