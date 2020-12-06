class Photos {
  int albumId, id;
  String title, url, thumbnailUrl;

  Photos({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
        albumId: json['albumId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        url: json['url'] as String,
        thumbnailUrl: json['thumbnailUrl'] as String);
  }
}
