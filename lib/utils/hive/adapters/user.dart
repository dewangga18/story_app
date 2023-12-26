import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject{
  @HiveField(0)
  String? userId;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? token;

  UserData({
    this.userId,
    this.name,
    this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userId: json["userId"],
      name: json["name"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "token": token,
      };
}
