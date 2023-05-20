import 'package:flutter_delivery/common/constant/data.dart';
import 'package:flutter_delivery/common/secure_storage/secure_storage.dart';
import 'package:flutter_delivery/user/model/user_model.dart';
import 'package:flutter_delivery/user/provider/auth_repository.dart';
import 'package:flutter_delivery/user/repository/user_me_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_me_provider.g.dart';

@Riverpod(keepAlive: true)
class UserMe extends _$UserMe {
  @override
  FutureOr<UserModel?> build() {
    getMe();
    return null;
  }

  Future<UserModel?> getMe() async {
    state = const AsyncLoading();

    final storage = ref.read(secureStorageProvider);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

    if (refreshToken == null || accessToken == null) {
      state = const AsyncData(null);
      return null;
    }

    final meResponse = await ref.read(userMeRepositoryProvider).getMe();

    state = await AsyncValue.guard(() async => meResponse);

    return meResponse;
  }

  Future<UserModel?> login({
    required String username,
    required String password,
  }) async {
    state = const AsyncLoading();

    final authRepository = ref.read(authRepositoryProvider);
    final storage = ref.read(secureStorageProvider);
    final response = await authRepository.login(
      username: username,
      password: password,
    );

    await storage.write(key: REFRESH_TOKEN_KEY, value: response.refreshToken);
    await storage.write(key: ACCESS_TOKEN_KEY, value: response.accessToken);

    final meResponse = await getMe();

    state = await AsyncValue.guard(() async => meResponse);

    return meResponse;
  }

  Future<void> logout() async {
    state = const AsyncData(null);

    final storage = ref.read(secureStorageProvider);
    await Future.wait([
      storage.delete(key: ACCESS_TOKEN_KEY),
      storage.delete(key: REFRESH_TOKEN_KEY)
    ]);
  }
}
