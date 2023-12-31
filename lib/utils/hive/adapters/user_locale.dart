import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_locale.g.dart';
part 'user_locale.freezed.dart';

@freezed
abstract class UserLocale extends HiveObject with _$UserLocale {
  UserLocale._();

  @HiveType(typeId: 1)
  factory UserLocale({@HiveField(0) String? locale}) = _UserLocale;
}
