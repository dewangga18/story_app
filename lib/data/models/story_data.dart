import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_data.g.dart';
part 'story_data.freezed.dart';

@freezed
class StoryData with _$StoryData {
  const factory StoryData({
    String? id,
    String? name,
    String? description,
    String? photoUrl,
    String? createdAt,
    double? lat,
    double? lon,
  }) = _StoryData;

  factory StoryData.fromJson(json) => _$StoryDataFromJson(json);
}
