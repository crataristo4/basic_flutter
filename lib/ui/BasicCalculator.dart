import 'package:flutter/material.dart';
import 'package:flutter_network/basicCalculator/AdditionPage.dart';
import 'package:flutter_network/basicCalculator/DivisionPage.dart';
import 'package:flutter_network/basicCalculator/MultiplicationPage.dart';
import 'package:flutter_network/basicCalculator/SubtractionPage.dart';

class BasicCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdditionPage additionPage = new AdditionPage();
    SubtractionPage subtractionPage = new SubtractionPage();
    DivisionPage divisionPage = new DivisionPage();
    MultiplicationPage multiplicationPage = new MultiplicationPage();

    final List<String> title = ['Addition','Subtraction','Multiplication','Division'];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: title.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Basic Calculator"),
              centerTitle: true,
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: title[0],
                  ),
                  Tab(
                    text: title[1],
                  ),
                  Tab(
                    text: title[2],
                  ),
                  Tab(
                    text: title[3],
                  ),
                ],
                isScrollable: true,
                indicatorColor: Colors.white,
                indicatorWeight: 4.0,
              ),
            ),
            body: TabBarView(children: [
              additionPage,
              subtractionPage,
              multiplicationPage,
              divisionPage,
            ]),
          )),
    );
  }
}

class _BasicCalculator extends StatefulWidget {
  final title;

  _BasicCalculator({Key key, this.title}) : super(key: key);

  @override
  __BasicCalculatorState createState() => __BasicCalculatorState();
}

class __BasicCalculatorState extends State<_BasicCalculator> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
