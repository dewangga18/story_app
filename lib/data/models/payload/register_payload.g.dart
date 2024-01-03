// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterPayloadImpl _$$RegisterPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterPayloadImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$RegisterPayloadImplToJson(
        _$RegisterPayloadImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
