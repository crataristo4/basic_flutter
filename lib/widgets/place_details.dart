import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network/model/place.dart';
import 'package:flutter_network/model/places_data.dart';

class PlaceDetails extends StatelessWidget {
  final Place place;

  PlaceDetails({this.place});

  Widget largeWidget(Color color) {
    return SingleChildScrollView(
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 8.0,
        margin: EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              children: [
                Image.asset(
                  place.image,
                  fit: BoxFit.cover,
                ),
                titleSection()
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: buttonSection(color),
                ),
                textSection()
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget smallWidget(Color color) {
    return ListView(
      children: [
        Image.asset(
          place.image,
          width: 320,
          fit: BoxFit.cover,
        ),
        titleSection(),
        buttonSection(color),
        textSection()
      ],
    );
  }

  Widget titleSection() {
    return Container(
      padding: EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    place.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  place.subtitle,
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.grey[500],
          ),
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Text("54"),
          )
        ],
      ),
    );
  }

  Widget textSection() {
    //contains the description of the place
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(Places().getPlaceDescription()),
    );
  }

  Widget buttonSection(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buttonColumn(color, Icons.call, "Call"),
        buttonColumn(color, Icons.near_me, "Route"),
        buttonColumn(color, Icons.share, "Share"),
      ],
    );
  }

  buttonColumn(Color color, IconData iconData, String label) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: color,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                label,
                style: TextStyle(fontSize: 12, color: color),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return LayoutBuilder(builder: (BuildContext context,BoxConstraints constrains) {
      if (constrains.maxWidth >= 600)
        return largeWidget(color);
      else
        return smallWidget(color);
    });
  }
}
