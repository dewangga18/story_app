class StoryResponse {
  bool? error;
  String? message;
  List<StoryData>? listStory;

  StoryResponse({
    this.error,
    this.message,
    this.listStory,
  });

  factory StoryResponse.fromJson(Map<String, dynamic> json) {
    return StoryResponse(
      error: json["error"],
      message: json["message"],
      listStory: json["listStory"] == null
          ? []
          : List<StoryData>.from(
              json["listStory"]!.map(
                (x) => StoryData.fromJson(x),
              ),
            ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "error": error,
      "message": message,
      "listStory": listStory == null
          ? []
          : List<dynamic>.from(
              listStory!.map((x) => x.toJson()),
            ),
    };
  }
}

class StoryData {
  String? id;
  String? name;
  String? description;
  String? photoUrl;
  String? createdAt;
  double? lat;
  double? lon;

  StoryData({
    this.id,
    this.name,
    this.description,
    this.photoUrl,
    this.createdAt,
    this.lat,
    this.lon,
  });

  factory StoryData.fromJson(Map<String, dynamic> json) {
    return StoryData(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      photoUrl: json["photoUrl"],
      createdAt: json["createdAt"],
      lat: json["lat"]?.toDouble(),
      lon: json["lon"]?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "photoUrl": photoUrl,
      "createdAt": createdAt,
      "lat": lat,
      "lon": lon,
    };
  }
}
