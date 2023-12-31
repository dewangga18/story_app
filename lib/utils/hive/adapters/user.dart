import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@freezed
abstract class UserData extends HiveObject with _$UserData {
  UserData._();

  @HiveType(typeId: 0)
  factory UserData({
    @HiveField(0) String? userId,
    @HiveField(1) String? name,
    @HiveField(2) String? token,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}
