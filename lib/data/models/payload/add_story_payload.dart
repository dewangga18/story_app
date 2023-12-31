import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_story_payload.g.dart';
part 'add_story_payload.freezed.dart';

@freezed
class AddStoryPayload with _$AddStoryPayload {
  const factory AddStoryPayload({
    required String description,
    required String fileName,
    required List<int> photo,
  }) = _AddStoryPayload;

  factory AddStoryPayload.fromJson(json) => _$AddStoryPayloadFromJson(json);
}
