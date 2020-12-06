import 'package:flutter/material.dart';

Widget MyHome(){



  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: ThemeData().primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity),

  );
}