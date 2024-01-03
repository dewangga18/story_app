// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_story_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddStoryPayloadImpl _$$AddStoryPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$AddStoryPayloadImpl(
      description: json['description'] as String,
      fileName: json['fileName'] as String,
      photo: (json['photo'] as List<dynamic>).map((e) => e as int).toList(),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AddStoryPayloadImplToJson(
        _$AddStoryPayloadImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'fileName': instance.fileName,
      'photo': instance.photo,
      'lat': instance.lat,
      'lon': instance.lon,
    };
