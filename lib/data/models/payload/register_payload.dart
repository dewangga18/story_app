import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_payload.g.dart';
part 'register_payload.freezed.dart';

@freezed
class RegisterPayload with _$RegisterPayload {
  const factory RegisterPayload({
  String? name,
  String? email,
  String? password,
  }) = _RegisterPayload;

  factory RegisterPayload.fromJson(json) => _$RegisterPayloadFromJson(json);
}
