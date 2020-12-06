import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network/model/Posts.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class FakePosts extends StatelessWidget {
  final String title = "fAKE Posts";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: ThemeData().primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: _FakePosts(
        title: title,
      ),
    );
  }
}

class _FakePosts extends StatefulWidget {
  final String title;

  _FakePosts({Key key, this.title}) : super(key: key);

  @override
  __FakePostsState createState() => __FakePostsState();
}

class __FakePostsState extends State<_FakePosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Fake Posts"),
      ),
      body: FutureBuilder<List<Posts>>(
        builder: (context, dataSnapshot) {
          if (dataSnapshot.hasError) {
            print(dataSnapshot.error);
          }

          return dataSnapshot.hasData
              ? PhotoListItems(mPosts: dataSnapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
        future: getPosts(http.Client()),
      ),
    );
  }
}

Future<List<Posts>> getPosts(http.Client client) async {
  String url = "https://jsonplaceholder.typicode.com/posts";

  final response = await client.get(url);

  return compute(mPosts,response.body);
}

FutureOr<List<Posts>> mPosts(String data) {
  final listOfFakePosts = json.decode(data).cast<Map<String, dynamic>>();

  return listOfFakePosts.map<Posts>((json) => Posts.fromJson(json)).toList();
}

class PhotoListItems extends StatelessWidget {
  final List<Posts> mPosts;

  PhotoListItems({Key key, this.mPosts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            onTap: (){
              print(mPosts[index].title);
            },
            title: Text(mPosts[index].title.toUpperCase()),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(mPosts[index].body,style: TextStyle(letterSpacing: 2.0,fontStyle: FontStyle.italic,color: Colors.blue),),
            ),
          ),
        );
      },
      itemCount: mPosts.length,
    );
  }
}
