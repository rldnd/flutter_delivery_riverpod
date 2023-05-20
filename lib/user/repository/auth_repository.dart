import 'package:dio/dio.dart';
import 'package:flutter_delivery/common/constant/data.dart';
import 'package:flutter_delivery/common/dio/dio.dart';
import 'package:flutter_delivery/common/model/login_response.dart';
import 'package:flutter_delivery/common/model/token_response.dart';
import 'package:flutter_delivery/common/utils/data_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(dio: dio, baseUrl: 'http://$ip/auth');
}

class AuthRepository {
  final String baseUrl;
  final Dio dio;

  const AuthRepository({required this.baseUrl, required this.dio});

  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    final serialized = DataUtils.plainToBase64('$username:$password');
    final response = await dio.post(
      '$baseUrl/login',
      options: Options(
        headers: {'authorization': 'Basic $serialized'},
      ),
    );

    return LoginResponse.fromJson(response.data);
  }

  Future<TokenResponse> token() async {
    final response = await dio.post(
      '$baseUrl/token',
      options: Options(
        headers: {REFRESH_TOKEN_KEY: true},
      ),
    );

    return TokenResponse.fromJson(response.data);
  }
}
