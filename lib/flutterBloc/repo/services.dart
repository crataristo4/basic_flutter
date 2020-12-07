import 'package:flutter_network/constants/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter_network/flutterBloc/model/postsList.dart';

abstract class PostRepository {
//gets all posts
  Future<List<Posts>> getAllPosts();
}

class PostServices implements PostRepository {
  @override
  Future<List<Posts>> getAllPosts() async {
    Uri uri = Uri.https(MyConstants().baseUrl, MyConstants().getPostsFromUrl);
    Response response = await http.get(uri);
    List<Posts> postLists = postsFromJson(response.body);

    return postLists;
  }
}
