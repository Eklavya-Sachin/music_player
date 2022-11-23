class Musics {
  late String title;
  late String singer;
  late String image;
  late String url;

  Musics({
    required this.title,
    required this.singer,
    required this.image,
    required this.url,
  });

  Musics.fromMap(Map<String, dynamic> map) {
    title = map["title"];
    singer = map["singer"];
    image = map["image"];
    url = map["url"];
  }
}
