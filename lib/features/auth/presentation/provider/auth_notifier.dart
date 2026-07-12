import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup/features/auth/presentation/provider/auth_providers.dart';

// Change: Extend Notifier<AsyncValue<void>> instead of _$AuthNotifier
class AuthNotifier extends Notifier<AsyncValue<void>> {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> login(String phoneNumber) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(loginUseCaseProvider);
    state = await AsyncValue.guard(() => useCase.call(phoneNumber));
  }
}

// Manually define the provider
final authNotifierProvider = NotifierProvider<AuthNotifier, AsyncValue<void>>(
  () {
    return AuthNotifier();
  },
);
