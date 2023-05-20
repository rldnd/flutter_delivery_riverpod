import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';
part 'login_response.freezed.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String refreshToken,
    required String accessToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
