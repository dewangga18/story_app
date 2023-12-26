// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_locale.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLocaleAdapter extends TypeAdapter<UserLocale> {
  @override
  final int typeId = 1;

  @override
  UserLocale read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLocale(
      locale: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserLocale obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.locale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLocaleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
