import 'package:fundamental_app/moduls/data_from_internet/models/social_media.dart';

class User {
  final String id;
  final String name;
  final String address;
  List<String> hobbies;
  SocialMedia socialMedia;

  User(
      {required this.id,
      required this.name,
      required this.address,
      required this.hobbies,
      required this.socialMedia});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      hobbies: List<String>.from(json["hobbies"].map((x) => x)),
      socialMedia: SocialMedia.fromJson(json['social_media']),
    );
  }
}
