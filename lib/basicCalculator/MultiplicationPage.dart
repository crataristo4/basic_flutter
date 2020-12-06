import 'package:flutter/material.dart';

class MultiplicationPage extends StatefulWidget {
  @override
  _MultiplicationPageState createState() => _MultiplicationPageState();
}

class _MultiplicationPageState extends State<MultiplicationPage>  with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  double firstNumber, secondNumber;
  double results;



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
              child: TextField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Enter first number",
                ),
                onChanged: (firstNum) {
                  firstNumber = double.parse(firstNum);
                },
              ),
            ),
            Divider(
              height: 32.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
              child: TextField(
                keyboardType: TextInputType.number,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Enter second number",
                ),
                onChanged: (secondNum) {
                  secondNumber = double.parse(secondNum);
                },
              ),
            ),
            Divider(
              height: 32.0,
            ),
            RaisedButton(
              color: Colors.red,
              onPressed: () {
                setState(() {
                  results = (firstNumber * secondNumber);
                });
              },
              child: Text(
                "Multiply",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Divider(
              height: 32.0,
            ),
            Text(results == null ? " " : "$results")
          ],
        ),
      ),
    );
  }


}
