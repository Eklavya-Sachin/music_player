class SongDetailsModel {
  final String title;
  final String singer;
  final String image;
  final String url;

  SongDetailsModel({
    required this.title,
    required this.singer,
    required this.image,
    required this.url,
  });

  factory SongDetailsModel.fromJson(Map<String, dynamic> json) =>
      SongDetailsModel(
        title: json["title"],
        singer: json["singer"],
        image: json["image"],
        url: json["url"],
      );
}
