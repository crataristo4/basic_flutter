import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network/constants/Constants.dart';
import 'package:flutter_network/model/Photos.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Photos>> getPhotos(http.Client client) async {
  String url = MyConstants().getPhotos;

  final response = await client.get(url);

  return compute(parsedJson, response.body);
}

class FetchFakePhotosState extends StatefulWidget {
  FetchFakePhotosState({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FetchFakePhotosStateState createState() => _FetchFakePhotosStateState();
}

class _FetchFakePhotosStateState extends State<FetchFakePhotosState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Fake.",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Photos",
              style: TextStyle(color: Colors.white54),
            )
          ],
        ),
      ),
      body: FutureBuilder<List<Photos>>(builder: (context, snapShot) {
        if (snapShot.hasError) {
          print(snapShot.error);
        }
        return snapShot.hasData
            ? PhotoList(
                photoList: snapShot.data,
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },future: getPhotos(http.Client()),),
    );
  }
}

class FetchFakePhotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My fake photos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FetchFakePhotosState(title: 'Fake Photo'),
    );
  }
}

FutureOr<List<Photos>> parsedJson(String response) {
  final listItems = json.decode(response).cast<Map<String, dynamic>>();

  return listItems.map<Photos>((json) => Photos.fromJson(json)).toList();
}

class PhotoList extends StatelessWidget {
  final List<Photos> photoList;

  PhotoList({Key key, this.photoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: photoList.length,
        itemBuilder: (context, index) {
          return Image.network(photoList[index].thumbnailUrl);
        });
  }
}
