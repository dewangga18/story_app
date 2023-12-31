// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthPayloadImpl _$$AuthPayloadImplFromJson(Map<String, dynamic> json) =>
    _$AuthPayloadImpl(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$AuthPayloadImplToJson(_$AuthPayloadImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
