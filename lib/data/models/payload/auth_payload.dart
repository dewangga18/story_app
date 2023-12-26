class AuthPayload {
  String? name;
  String? email;
  String? password;

  AuthPayload({
    this.name,
    this.email,
    this.password,
  });

  factory AuthPayload.fromJson(Map<String, dynamic> json) {
    return AuthPayload(
      name: json["name"],
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (password != null) "password": password,
    };
  }
}
