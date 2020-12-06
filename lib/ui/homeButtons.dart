import 'package:flutter/material.dart';
import 'package:flutter_network/loginBlocPattern/login.dart';
import 'package:flutter_network/pages/homePage.dart';
import 'package:flutter_network/ui/BasicCalculator.dart';
import 'package:flutter_network/ui/FakeData.dart';
import 'package:flutter_network/ui/FetchFakePhotos.dart';
import 'package:flutter_network/ui/GetFakePhotos.dart';
import 'package:flutter_network/ui/LoadFakePosts.dart';
import 'package:flutter_network/ui/ProfilePage.dart';

class ButtonClicks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FakeData();
                  }));
                },
                child: Text(
                  "Fetch fake data",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              RaisedButton(
                elevation: 2.0,
                color: Colors.red,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FetchFakePhotos();
                  }));
                },
                child: Text("Fake Photos",style: TextStyle(color: Colors.white),),
              ),
              RaisedButton(
                elevation: 8.0,
                color: Colors.black87,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GetFakePhotos();
                  }));
                },
                child: Text("Load Fake Photos",style: TextStyle(color: Colors.white),),
              ),
              RaisedButton(
                elevation: 8.0,
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FakePosts();
                  }));
                },
                child: Text("LOAD ALL FAKE POSTS",style: TextStyle(color: Colors.white),),
              ),
              RaisedButton(
                elevation: 8.0,
                color: Colors.cyanAccent,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BasicCalculator();
                  }));
                },
                child: Text("Basic Calculator",style: TextStyle(color: Colors.black),),
              ),

              RaisedButton(
                elevation: 8.0,
                color: Colors.deepOrange,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
                child: Text("Responsive design",style: TextStyle(color: Colors.white),),
              ),

              RaisedButton(
                elevation: 8.0,
                color: Colors.deepOrange,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfilePage();
                  }));
                },
                child: Text("Upload to fb",style: TextStyle(color: Colors.white),),
              ),
              FlatButton(
                color: Colors.blueGrey,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: Text("Log in bloc pattern",style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
