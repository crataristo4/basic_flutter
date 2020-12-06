import 'package:flutter/material.dart';
import 'package:flutter_network/constants/Constants.dart';
import 'package:flutter_network/model/Posts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Posts> fetchData() async {
  final response =
      await http.get(MyConstants().getPosts);

  if (response.statusCode == 200) {
    return Posts.fromJson(json.decode(response.body));
  } else {
    throw Exception("Can not fetch data");
  }
}

class FakeDataState extends StatefulWidget {
  FakeDataState({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FakeDataState createState() => _FakeDataState();
}

class _FakeDataState extends State<FakeDataState> {
  final posts = fetchData();

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
              "Data",
              style: TextStyle(color: Colors.white54),
            )
          ],
        ),
      ),
      body: Center(
        child: FutureBuilder<Posts>(
            future: posts,
            builder: (context, dataSnapShot) {
              if (dataSnapShot.hasError) {
                return Text("${dataSnapShot.error}");
              } else if (dataSnapShot.hasData) {
                return Text(dataSnapShot.data.title);
              }
              return CircularProgressIndicator();
            }),
      )
    );
  }
}

class FakeData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My fake data',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FakeDataState(title: 'Fake Data'),
    );
  }
}
