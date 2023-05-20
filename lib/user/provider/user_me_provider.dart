import 'package:flutter_delivery/common/constant/data.dart';
import 'package:flutter_delivery/common/secure_storage/secure_storage.dart';
import 'package:flutter_delivery/user/model/user_model.dart';
import 'package:flutter_delivery/user/repository/user_me_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_me_provider.g.dart';

@Riverpod(keepAlive: true)
class UserMe extends _$UserMe {
  @override
  FutureOr<UserModel?> build() {
    return null;
  }

  Future<void> getMe() async {
    state = const AsyncLoading();

    final storage = ref.read(secureStorageProvider);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

    if (refreshToken == null || accessToken == null) return;

    state = await AsyncValue.guard(
      () async => ref.read(userMeRepositoryProvider).getMe(),
    );
  }
}
