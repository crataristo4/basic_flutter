import 'dart:convert';


List<Posts> postsFromJson(String str) =>
    List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> postsList) =>
    json.encode(List<dynamic>.from(postsList.map((e) => e.postToJson())));

class Posts {
  int userId, id;
  String title, body;

  Posts({this.userId, this.id, this.title, this.body});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }

  Map<String, dynamic> postToJson() =>
      {"userId": userId, "id": id, "title": title, "body": body};
}
