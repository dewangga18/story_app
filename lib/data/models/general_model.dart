class GeneralResponse {
  bool? error;
  String? message;

  GeneralResponse({
    this.error,
    this.message,
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> json) {
    return GeneralResponse(
      error: json["error"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "error": error,
      "message": message,
    };
  }
}
