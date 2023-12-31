// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataImplAdapter extends TypeAdapter<_$UserDataImpl> {
  @override
  final int typeId = 0;

  @override
  _$UserDataImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserDataImpl(
      userId: fields[0] as String?,
      name: fields[1] as String?,
      token: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$UserDataImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'token': instance.token,
    };
