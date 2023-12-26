import 'package:hive_flutter/hive_flutter.dart';

part 'user_locale.g.dart';

@HiveType(typeId: 1)
class UserLocale {
  @HiveField(0)
  String? locale;

  UserLocale({this.locale});
}