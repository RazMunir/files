import 'package:flutter/material.dart';

//organize code: decrease code from main function
void main() {
  runApp(new Second());
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.red,
        child: Center(
          child: Text(
            "Hello Bro",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 40.0),
          ),
        ));
  }
}
