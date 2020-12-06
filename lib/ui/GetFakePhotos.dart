import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_network/model/Photos.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class GetFakePhotos extends StatelessWidget {
  final String title = "Get Fake Photos";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GetFakePhotosState(
        title: title,
      ),
    );
  }
}

class GetFakePhotosState extends StatefulWidget {
  GetFakePhotosState({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GetFakePhotosStateState createState() => _GetFakePhotosStateState();
}

class _GetFakePhotosStateState extends State<GetFakePhotosState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Get.",
              style: TextStyle(
                  color: Colors.white54,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Photos ",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.0),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Photos>>(
        builder: (context, data) {
          if (data.hasError) {
            print(data.error);
          }

          //if data is not empty return list of data else return a loading indicator
          return data.hasData
              ? MyFakePhotoListTiles(mPhotos: data.data)
              : Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                    strokeWidth: 4.0,
                  ),
                );
        },
        future: getFakePhotos(http.Client()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("tapped");
        },
        tooltip: "Add photo",
        child: Icon(Icons.add_a_photo),
        backgroundColor: Colors.amber,
      ),
    );
  }
}

class MyFakePhotoListTiles extends StatelessWidget {
  final List<Photos> mPhotos;

  MyFakePhotoListTiles({Key key, this.mPhotos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, itemList) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(mPhotos[itemList].thumbnailUrl),
            ),
            title: Text(mPhotos[itemList].title.toUpperCase()),
          ),
        );
      },
      itemCount: mPhotos.length,
    );
  }
}

class MyFakePhotoList extends StatelessWidget {
  final List<Photos> mPhotos;

  MyFakePhotoList({Key key, this.mPhotos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: mPhotos.length,
        itemBuilder: (context, index) {
          return Image.network(mPhotos[index].thumbnailUrl);
        });
  }
}

Future<List<Photos>> getFakePhotos(http.Client client) async {
  String url = "https://jsonplaceholder.typicode.com/photos";

  final response = await client.get(url);

  return compute(parsedJsonPhotos, response.body);
}

FutureOr<List<Photos>> parsedJsonPhotos(String message) {
  final listOfFakePhotos = json.decode(message).cast<Map<String, dynamic>>();

  return listOfFakePhotos.map<Photos>((json) => Photos.fromJson(json)).toList();
}
