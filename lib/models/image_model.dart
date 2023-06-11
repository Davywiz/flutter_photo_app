import 'dart:convert';

class ImageModel {
  int id;

  String name;

  String tagline;

  String description;

  String imageUrl;

  ImageModel({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'tagline': tagline,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'] as int,
      name: map['name'] as String,
      tagline: map['tagline'] as String,
      description: map['description'] as String,
      imageUrl: map['image_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
