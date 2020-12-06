import 'package:flutter/material.dart';
import 'package:flutter_network/model/place.dart';
import 'package:flutter_network/model/places_data.dart';
import 'package:flutter_network/responsive_desing_util.dart';
import 'package:flutter_network/widgets/place_details.dart';
import 'package:flutter_network/widgets/place_gallery.dart';

class HomePage extends StatelessWidget {
  final String title = "Responsive Design";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: ThemeData().primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePageState(
        title: Text(title),
      ),
    );
  }
}

class HomePageState extends StatefulWidget {
  final title;

  HomePageState({Key key, this.title}) : super(key: key);

  @override
  _HomePageStateState createState() => _HomePageStateState();
}

class _HomePageStateState extends State<HomePageState> {
  Place selectedPlace = Places().getPlaces()[0];

  void handleSelectedPlace(Place newPlace) {
    setState(() {
      selectedPlace = newPlace;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;

    switch (getScreenSize(MediaQuery.of(context).size.width)) {
      case ScreenSize.small:
        widget = smallHomePage();
        break;
      case ScreenSize.medium:
        widget = mediumHomePage();
        break;
      case ScreenSize.large:
        widget = largeHomePage();
        break;
    }

    return widget;
  }

  Widget smallHomePage() {
    return Scaffold(
      appBar: appBar(),
      drawer: Drawer(
        child: drawerBody(),
      ),
      body: PlacesGallery(handlePlaceChanged: handleSelectedPlace,),
    );

  }

  Widget mediumHomePage() {
    return Scaffold(
      appBar: appBar(),
      drawer: Drawer(
        child: drawerBody(),
      ),
      body: Row(
        children: [
          drawerBody(),
          Expanded(flex: 5, child: drawerBody()),
          Expanded(
              flex: 5,
              child: PlacesGallery(handlePlaceChanged: handleSelectedPlace)),
        ],
      ),
    );
  }

  Widget largeHomePage() {
      return Scaffold(
        appBar: appBar(),
        body: Row(
          children: [
            //Expanded(flex: 1, child: drawerBody()),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: PlacesGallery(
                              handlePlaceChanged: handleSelectedPlace,
                              showHorizontalGridView: true)),
                      Expanded(flex: 2, child: PlaceDetails(place: selectedPlace))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  }

  Widget appBar() {
    return AppBar(
      centerTitle: true,
      title: widget.title,
    );
  }

  Widget drawerBody() {
    final menuItems = Places().getPlacesName();

    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: menuItems.length + 1, // +1 for header
        itemBuilder: (context, index) {
          if (index == 0) {
            return DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(
                        'assets/images/india_chettinad_silk_maker.png')),
              ),
              child: Container(
                alignment: AlignmentDirectional.bottomStart,
                child: Text(
                  'South India',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            );
          } else {
            return ListTile(
                leading: Icon(Icons.location_city),
                title: Text(menuItems[index - 1]),
                selected: index == 4 ? true : false);
          }
        });
  }
}
