import 'package:flutter/material.dart';
import 'package:flutter_network/flutterBloc/bloc/bloc.dart';
import 'package:flutter_network/flutterBloc/myPost.dart';
import 'package:flutter_network/flutterBloc/repo/services.dart';
import 'package:flutter_network/ui/homeButtons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Basic Network'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: ButtonClicks(),
     /* body: BlocProvider(
        create: (context) => PostBloc(postRepository: PostServices()),
        child: MyPosts(),
      ),*/

    );
  }
}
