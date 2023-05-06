import 'package:dio/dio.dart';
import 'package:flutter_delivery/common/constant/data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  const CustomInterceptor({
    required this.storage,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers[ACCESS_TOKEN_KEY]) {
      options.headers.remove(ACCESS_TOKEN_KEY);

      final token = await storage.read(key: ACCESS_TOKEN_KEY);
      options.headers.addAll({'authorization': 'Bearer $token'});
    }

    if (options.headers[REFRESH_TOKEN_KEY]) {
      options.headers.remove(REFRESH_TOKEN_KEY);

      final token = await storage.read(key: REFRESH_TOKEN_KEY);
      options.headers.addAll({'authorization': 'Bearer $token'});
    }

    return super.onRequest(options, handler);
  }
}
