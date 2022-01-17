import 'package:flutter/material.dart';

//organize code: decrease code from main function
class MCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(
        "It is card with elevation",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 30.0),
      ),
      color: Colors.yellow,
      elevation: 10.0,
    );
  }
}
