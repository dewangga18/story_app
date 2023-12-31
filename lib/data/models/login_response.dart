import 'package:story_app/utils/hive/adapters/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';
part 'login_response.freezed.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    bool? error,
    String? message,
    UserData? loginResult,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(json) => _$LoginResponseFromJson(json);
  
}
