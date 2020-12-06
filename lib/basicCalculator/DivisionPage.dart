import 'package:flutter/material.dart';

class DivisionPage extends StatefulWidget {
  @override
  _DivisionPageState createState() => _DivisionPageState();
}

class _DivisionPageState extends State<DivisionPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  double firstNumber, secondNumber;
  double results ;

  @override
  // ignore: must_call_super
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
                  if (firstNum
                      .trim()
                      .toString()
                      .isEmpty) {
                    return "Please enter number ";
                  }
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
                onChanged: (String secondNum) {
                  secondNumber = double.parse(secondNum);
                },
              ),
            ),
            Divider(
              height: 32.0,
            ),
            RaisedButton(
              color: Colors.amber,
              onPressed: () {
                setState(() {
                  results = firstNumber / secondNumber;
                });
              },
              child: Text(
                "Divide",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Divider(
              height: 32.0,
            ),
            Text( results == null ? " " : "$results")
          ],
        ),
      ),
    );
  }


}

