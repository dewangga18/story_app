import 'package:story_app/utils/hive/adapters/user.dart';

class LoginResponse {
  bool? error;
  String? message;
  UserData? loginResult;

  LoginResponse({
    this.error,
    this.message,
    this.loginResult,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      error: json["error"],
      message: json["message"],
      loginResult: json["loginResult"] == null
          ? null
          : UserData.fromJson(json["loginResult"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "error": error,
      "message": message,
      "loginResult": loginResult?.toJson(),
    };
  }
}
