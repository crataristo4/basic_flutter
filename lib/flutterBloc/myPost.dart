import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/flutterBloc/bloc/bloc.dart';
import 'package:flutter_network/flutterBloc/bloc/events.dart';
import 'package:flutter_network/flutterBloc/bloc/postStates.dart';
import 'package:flutter_network/flutterBloc/itemslist.dart';
import 'package:flutter_network/flutterBloc/loading.dart';
import 'package:flutter_network/flutterBloc/model/postsList.dart';

import 'errormessages/errormsg.dart';

class MyPosts extends StatefulWidget {
  @override
  _MyPostsState createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  @override
  void initState() {
    super.initState();

    _loading();
  }

  _loading() async {
    context.bloc<PostBloc>().add(PostEvents.fetchAllPosts);
    //**deprecated** context.bloc<PostBloc>().add(PostEvents.fetchAllPosts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Using bloc"),
        centerTitle: true,
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<PostBloc, PostState>(
          builder: (_, PostState postState) {
            if (postState is PostErrorState) {
              final error = postState.errorMessage;
              final errorMsg = "${error.message}\nTap to retry";
              return ErrorMessage(
                error: errorMsg,
                onTap: _loading,
              );
            }
            if (postState is PostLoaded) {
              List<Posts> posts = postState.posts;
              return _listOfPosts(posts);
            }

            return Loading();
          },
        )
      ],
    );
  }

  /*Widget _listOfPosts(List<Posts> postList) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (context, index) {
        Posts posts = postList[index];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            title: Text(
              posts.title,
              style: TextStyle(fontSize: 16),
            ),
            subtitle: Text(posts.body),
          ),
        );
      },
      itemCount: postList.length,
    ));
  }*/
  Widget _listOfPosts(List<Posts> postList) {
    return Expanded(
        child: ListView.builder(
      itemBuilder: (context, index) {
        Posts posts = postList[index];
        return ItemsList(
          posts: posts,
        );
      },
      itemCount: postList.length,
    ));
  }
}
