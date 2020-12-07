import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final error;
  final Function onTap;

  ErrorMessage({this.error, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
            child: Container(
      child: InkWell(
        onTap: onTap,
        child: Text(
          error,
          textAlign: TextAlign.center,
        ),
      ),
    )));
  }
}
