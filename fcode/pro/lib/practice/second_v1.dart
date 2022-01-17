import 'package:flutter/material.dart';

//organize code: decrease code from main function
class SecondV1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.red,
        child: Center(
          child: Text(
            "Hello Bro v1",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 40.0),
          ),
        ));
  }
}