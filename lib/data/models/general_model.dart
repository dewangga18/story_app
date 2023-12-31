import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_model.g.dart';
part 'general_model.freezed.dart';

@freezed
class GeneralResponse with _$GeneralResponse{
  const factory GeneralResponse({
    bool? error,
    String? message,
  }) = _GeneralResponse;

  factory GeneralResponse.fromJson(json) => _$GeneralResponseFromJson(json);
}
