import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_payload.g.dart';
part 'auth_payload.freezed.dart';

@freezed
class AuthPayload with _$AuthPayload {
  const factory AuthPayload({
  String? name,
  String? email,
  String? password,
  }) = _AuthPayload;

  factory AuthPayload.fromJson(json) => _$AuthPayloadFromJson(json);
}
