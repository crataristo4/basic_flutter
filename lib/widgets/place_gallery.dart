import 'package:flutter/material.dart';
import 'package:flutter_network/model/place.dart';
import 'package:flutter_network/model/places_data.dart';
import 'package:flutter_network/responsive_desing_util.dart';
import 'package:flutter_network/widgets/place_details.dart';

class PlacesGallery extends StatelessWidget {
  final handlePlaceChanged , showHorizontalGridView ;

  PlacesGallery({this.handlePlaceChanged, this.showHorizontalGridView = false});

  @override
  Widget build(BuildContext context) {
    int itemCount;
    Axis axisDirection;
    if (showHorizontalGridView) {
      // horizontal gallery
      itemCount = 1; // single row gallery
      axisDirection = Axis.horizontal;
    } else {
      // vertical gallery
      itemCount = 2; // two columns gallery
      axisDirection = Axis.vertical;
    }

    return Container(
      color: Colors.grey[200],
      child: GridView.count(
        crossAxisCount: itemCount,
        scrollDirection: axisDirection,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: EdgeInsets.all(8),
        childAspectRatio: 1 / 1.2,
        children: gridItems(),
      ),
    );
  }

  List<Widget> gridItems(){
    return Places()
        .getPlaces()
        .map<Widget>((place) => GridItems(place: place,handlePageChange: handlePlaceChanged,))
        .toList();

  }
}

class GridItems extends StatelessWidget {
  final Place place;
  final handlePageChange;

  GridItems({this.place, this.handlePageChange});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        onTap: () {
          switch(getScreenSize(MediaQuery.of(context).size.width)){
            case ScreenSize.small:
            case ScreenSize.medium:
              Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceDetails(place: place,)));

              break;
            case ScreenSize.large:
              handlePageChange(place);
              break;
          }
        },
        child: GridTile(
          child: Ink.image(
            image: AssetImage(place.image),
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(place.title),
            subtitle: Text(place.subtitle),
          ),
        ),
      ),
    );
  }
}
