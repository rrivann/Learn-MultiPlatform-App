class SocialMedia {
  SocialMedia({
    required this.instagram,
    required this.twitter,
  });

  String instagram;
  String twitter;

  factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
        instagram: json["instagram"],
        twitter: json["twitter"],
      );
}
