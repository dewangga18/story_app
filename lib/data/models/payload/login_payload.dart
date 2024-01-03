import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_payload.g.dart';
part 'login_payload.freezed.dart';

@freezed
class LoginPayload with _$LoginPayload {
  const factory LoginPayload({
  String? email,
  String? password,
  }) = _LoginPayload;

  factory LoginPayload.fromJson(json) => _$LoginPayloadFromJson(json);
}
