import 'dart:typed_data';

class AddStoryPayload {
  String description;
  String fileName;
  Uint8List photo;

  AddStoryPayload({
    required this.description,
    required this.fileName,
    required this.photo,
  });
}
