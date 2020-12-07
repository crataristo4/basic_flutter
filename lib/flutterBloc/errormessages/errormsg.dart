import 'dart:ui';

import 'package:flutter/cupertino.dart';
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
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
              ),
            )));
  }
}
