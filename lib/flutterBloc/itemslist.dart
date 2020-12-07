import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network/flutterBloc/model/postsList.dart';

class ItemsList extends StatelessWidget {
  final Posts posts;

  ItemsList({this.posts});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        child: Expanded(
            child: Column(children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              title: Text(
                posts.title,
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(posts.body),
            ),
          ),
          Divider(),
        ])));
  }
}
