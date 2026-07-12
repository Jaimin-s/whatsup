import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:whatsup/core/network/base_client.dart';
import 'package:whatsup/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:whatsup/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:whatsup/features/auth/domain/repository/auth_repository.dart';
import 'package:whatsup/features/auth/data/repository/auth_repository_impl.dart';
import 'package:whatsup/features/auth/domain/usecases/login_usecase.dart';

// base client provider
final baseClientProvider = Provider((ref) => BaseClient());

// data source
final AuthRemoteDataSourceProvider = Provider(
  (ref) => AuthRemoteDataSourceImpl(ref.read(baseClientProvider)),
);
final AuthLocalDataSourceProvider = Provider(
  (ref) => AuthLocalDataSourceImpl(const FlutterSecureStorage()),
);

// repository
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(
    localdatasource: ref.read(AuthLocalDataSourceProvider),
    remotedatasource: ref.read(AuthRemoteDataSourceProvider),
  ),
);

// use case
final loginUseCaseProvider = Provider(
  (ref) => LoginUsecase(ref.read(authRepositoryProvider)),
);
