import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/data/models/story_data.dart';

part 'story_response.g.dart';
part 'story_response.freezed.dart';

@freezed
class StoryResponse with _$StoryResponse{
  const factory StoryResponse({
    bool? error,
    String? message,
    List<StoryData>? listStory,
  }) = _StoryResponse;

  factory StoryResponse.fromJson(json) => _$StoryResponseFromJson(json);
}
