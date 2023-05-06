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
    if (options.headers[ACCESS_TOKEN_KEY] == true) {
      options.headers.remove(ACCESS_TOKEN_KEY);

      final token = await storage.read(key: ACCESS_TOKEN_KEY);
      options.headers.addAll({'authorization': 'Bearer $token'});
    }

    if (options.headers[REFRESH_TOKEN_KEY] == true) {
      options.headers.remove(REFRESH_TOKEN_KEY);

      final token = await storage.read(key: REFRESH_TOKEN_KEY);
      options.headers.addAll({'authorization': 'Bearer $token'});
    }

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

    if (refreshToken == null) {
      return handler.reject(err);
    }

    final isStatus401 = err.response?.statusCode == 401;
    final isPathRefresh = err.requestOptions.path == '/auth/token';

    if (isStatus401 && !isPathRefresh) {
      try {
        final dio = Dio();
        final response = await dio.post(
          'http://$ip/auth/token',
          options: Options(headers: {'authorization': 'Bearer $refreshToken'}),
        );

        final accessToken = response.data['accessToken'];
        final options = err.requestOptions;

        options.headers.addAll({'authorization': 'Bearer $accessToken'});
        await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);

        final reResponse = await dio.fetch(options);
        return handler.resolve(reResponse);
      } on DioError catch (e) {
        return handler.reject(e);
      }
    }

    return super.onError(err, handler);
  }
}
